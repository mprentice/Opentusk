# Copyright 2012 Tufts University 
#
# Licensed under the Educational Community License, Version 1.0 (the "License"); 
# you may not use this file except in compliance with the License. 
# You may obtain a copy of the License at 
#
# http://www.opensource.org/licenses/ecl1.php 
#
# Unless required by applicable law or agreed to in writing, software 
# distributed under the License is distributed on an "AS IS" BASIS, 
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
# See the License for the specific language governing permissions and 
# limitations under the License.


package HSDB45::Eval;

use strict;
use base qw(HSDB4::SQLRow);
use HSDB45::Eval::Question;
use HSDB45::Eval::Question::Results;
use HSDB45::Eval::Completion;
use HSDB4::SQLLink;
use HSDB45::Course;
use HSDB45::StyleSheet;
use HSDB4::StyleSheetType;
use TUSK::Constants;


BEGIN {
    use vars qw($VERSION);
    
    $VERSION = do { my @r = (q$Revision: 1.70 $ =~ /\d+/g); sprintf "%d."."%02d" x $#r, @r };
}

sub version {
    return $VERSION;
}

# dependencies for things that relate to caching
my @mod_deps  = ('HSDB45::Eval::Question',
		 'HSDB45::Eval::Question::Results',
		 'HSDB45::Eval::Completion',
		 'HSDB45::Course');

my @file_deps = ();

sub get_mod_deps {
    return @mod_deps;
}

sub get_file_deps {
    return @file_deps;
}


# File-private lexicals
my $tablename = "eval";
my $primary_key_field = "eval_id";
my @fields = qw(eval_id course_id time_period_id teaching_site_id title available_date modified
                due_date prelim_due_date submittable_date question_stylesheet results_stylesheet);
my %blob_fields = ();
my %numeric_fields = ();

my %cache = ();

# Creation methods

# Description: creates a new HSDB45::Eval object
# Input: _school => school, _id => id
# Output: newly created object
sub new {
    # Find out what class we are
    my $incoming = shift;
    # Call the super-class's constructor and give it all the values
    my $self = $incoming->SUPER::new ( _tablename => $tablename,
				       _fields => \@fields,
				       _blob_fields => \%blob_fields,
				       _numeric_fields => \%numeric_fields,
				       _primary_key_field => $primary_key_field,
				       _cache => \%cache,
				       @_,
				       );
    return $self;
}

sub split_by_school {
    my $self = shift;
    return 1;
}

sub admin_group {
    my $self = shift;
    my $group_id = HSDB4::Constants::get_eval_admin_group( $self->school() );
    return HSDB45::UserGroup->new( _school => $self->school(), _id => $group_id );
}

###############################
# Stylesheet lookup functions #
###############################

sub question_stylesheet_type {
    return HSDB4::StyleSheetType->new(_id => HSDB4::StyleSheetType::label_to_id("Eval"));
}

sub question_stylesheet_id {
    my $self = shift();
    return @_ ? $self->field_value('question_stylesheet', shift()) : $self->field_value('question_stylesheet');
}

sub title {
	my $self = shift;
	return $self->field_value('title');
}

sub question_stylesheet_ids {
    my $self = shift();
    return $self->question_stylesheet_type()->stylesheet_ids($self->school());
}

sub question_stylesheet {
    my $self = shift();
    my $stylesheet_id = $self->question_stylesheet_id();

    if($stylesheet_id) {
	return HSDB45::StyleSheet->new(_school => $self->school(), _id => $stylesheet_id);
    }
    else {
	my $stylesheet = $self->question_stylesheet_type()->default_stylesheet($self->school());
	return $stylesheet if($stylesheet->primary_key());
	return undef;
    }
}

sub question_stylesheets {
    my $self = shift();
    return $self->question_stylesheet_type()->stylesheets($self->school());
}

sub global_question_stylesheet {
    my $self = shift();
    return $self->question_stylesheet_type()->global_stylesheet();
}

sub results_stylesheet_type {
    return HSDB4::StyleSheetType->new(_id => HSDB4::StyleSheetType::label_to_id("EvalResults"));
}

sub results_stylesheet_id {
    my $self = shift();
    return @_ ? $self->field_value('results_stylesheet', shift()) : $self->field_value('results_stylesheet');
}

sub results_stylesheet_ids {
    my $self = shift();
    return $self->results_stylesheet_type()->stylesheet_ids($self->school());
}

sub results_stylesheet {
    my $self = shift();
    my $stylesheet_id = $self->results_stylesheet_id();

    if($stylesheet_id) {
	return HSDB45::StyleSheet->new(_school => $self->school(), _id => $stylesheet_id);
    }
    else {
	my $stylesheet = $self->results_stylesheet_type()->default_stylesheet($self->school());
	return $stylesheet if($stylesheet->primary_key());
	return undef;
    }
}

sub results_stylesheets {
    my $self = shift();
    return $self->results_stylesheet_type()->stylesheets($self->school());
}

sub global_results_stylesheet {
    my $self = shift();
    return $self->results_stylesheet_type()->global_stylesheet();
}

sub user_groups {
    #
    # Gets the user groups associated with this ID
    #

    my $self = shift;
    unless ($self->{-user_groups}) {
        my $course = $self->course();
        my @groups = $course->child_user_groups($self->field_value('time_period_id'));
        $self->{-user_groups} = \@groups;
    }
    return @{$self->{-user_groups}};
}



# Description: returns the course object to which the eval belongs
# Input: none
# Output: course object
sub course {
    my $self = shift();
    # Check the cache
    unless ($self->{-course}) {
	$self->{-course} = HSDB45::Course->new (_school => $self->school,
						_id => $self->field_value ('course_id'));
    }
    return $self->{-course};
}

# Description: returns the time_period object to which the eval belongs
# Input: none
# Output: course object
sub time_period {
    my $self = shift();
    # Check the cache
    unless ($self->{-time_period}) {
	$self->{-time_period} = 
	  HSDB45::TimePeriod->new (_school => $self->school,
				   _id => $self->field_value ('time_period_id'));
    }
    return $self->{-time_period};
}

sub question_link {
    my $self = shift;
    my $db = $self->school_db();
    return $HSDB4::SQLLinkDefinition::LinkDefs{"$db\.link_eval_eval_question"};
}

# Description: returns question objects that belong to the eval
# Input: none
# Output: list of question objects
sub questions {
    my ($self) = @_;

    my $auto_increment = 0;
    my $child_items = $self->question_link()->get_children($self->primary_key());

    my @children = $child_items->children();
    for my $q (@children) {
	$q->set_aux_info(parent_eval => $self);

	my $label = $q->label();
	$q->set_real_label($label);

    }

    return $child_items->children();
}

sub binnable_questions {
    my $self = shift;
    my @binnables = ();
    for my $q ($self->questions()) { 
	if (HSDB45::Eval::Question::Results::is_type_binnable($q->body()->question_type())) {
	    push @binnables, $q;
	}
    }
    return @binnables;
}

# Description: Returns some SPECIFIC questions, as defined for this eval object
# Input: eval_question_id's
# Output: A list of the Eval::Question::Objects (or just the first one, if in scalar context)
sub question {
    my $self = shift;
    my %question_ids = ();
    my @questions = ();
    for (@_) { $question_ids{$_} = 1 }
    # Go through all of the questions
    for ($self->questions ()) {
	if ($question_ids{$_->field_value ('eval_question_id')}) {
	    delete $question_ids{$_->field_value ('eval_question_id')};
	    push @questions, $_;
	    last unless keys %question_ids;
	}
    }
    return unless @questions;
    return wantarray ? @questions : $questions[0];
}

# Description: Makes sure there's no cached items in the question list
# Input:
# Output:
sub reset_question_cache {
    my $self = shift;
    return;
}

# Description: Adds a link to a child question
# Input: DB username/password, the child question ID, 
#        and then the link fields in 'field => "value"' format
# Output: Success flag, and a message describing an error
sub add_child_question {
    my $self = shift;
    my ($u, $p, $qid, %fields) = @_;

    my ($r, $msg) = $self->question_link()->insert( -user => $u, -password => $p,
						    -child_id => $qid,
						    -parent_id => $self->primary_key,
						    %fields);
    if ($r) { $self->reset_question_cache() }
    return ($r, $msg);
}

# Description: Delete's a link to a child question
# Input: DB username/password, and the child question ID
# Output:
sub delete_child_question {
    my $self = shift;
    my ($first,$second,$qid) = @_;
    my ($u,$p);
    # handling case where password is not passed to function;
    if (!defined($second) && !defined($qid)){
	($u,$p) =  ($TUSK::Constants::DatabaseUsers{ContentManager}->{writeusername},$TUSK::Constants::DatabaseUsers{ContentManager}->{writepassword});
	$qid = $first;
    } else {
	($u,$p) = ($first,$second);
    }

    my ($r, $msg) = $self->question_link()->delete( -user => $u, -password => $p,
						    -child_id => $qid,
						    -parent_id => $self->primary_key );
    if ($r) { 
	# Now, delete all of the QuestionRef's which referred to that one
	for my $refq ( grep { $_->body()->is_reference() } $self->questions() ) {
	    next unless $refq->body()->target_question_id() == $qid;
	    $self->question_link()->delete( -user => $u, -password => $p,
					    -child_id => $refq->primary_key(),
					    -parent_id => $self->primary_key() );
	}
	$self->reset_question_cache();
    }
    return ($r, $msg);
}

# Description: Updates a link to a child question
# Input: DB username/password, the child question ID, and the link fields in 'field => "value"' format
# Output:
sub update_child_question_link {
    my $self = shift;
    my ($u, $p, $qid, %fields) = @_;

    my ($r, $msg) = $self->question_link()->update( -user => $u, -password => $p,
						    -child_id => $qid,
						    -parent_id => $self->primary_key,
						    %fields);
    if ($r) { $self->reset_question_cache() }
    return ($r, $msg);
}

sub available_date {
    #
    # Return a date object which is the available date
    #

    my $self = shift;
    unless ($self->{-available_date}) {
	return unless $self->field_value ('available_date') =~ /[1-9]+/;
	my $dt = HSDB4::DateTime->new ();
	$dt->in_mysql_date ($self->field_value ('available_date'));
	$self->{-available_date} = $dt;
    }
    return $self->{-available_date};
}

sub due_date {
    #
    # Return a date object which is the due date
    #
    
    my $self = shift;
    unless ($self->{-due_date}) {
	return unless $self->field_value ('due_date') =~ /[1-9]+/;
	my $dt = HSDB4::DateTime->new ();
	$dt->in_mysql_date ($self->field_value ('due_date'));
	$self->{-due_date} = $dt;
    }
    return $self->{-due_date};
}


sub prelim_due_date {
    #
    # Return a date object which is the prelim due date
    #
    
    my $self = shift;
    unless ($self->{-prelim_due_date}) {
	return unless $self->field_value ('prelim_due_date') =~ /[1-9]+/;
	my $dt = HSDB4::DateTime->new ();
	$dt->in_mysql_date ($self->field_value ('prelim_due_date'));
	$self->{-prelim_due_date} = $dt;
    }
    return $self->{-prelim_due_date};
}


sub academic_year {
    my $self = shift();
    return 1998 unless($self->due_date);
    my @gmtime = gmtime($self->due_date->out_unix_time());
    my $month = $gmtime[4];
    my $year  = $gmtime[5] + 1900;
    return ($month >= 7) ? $year : $year-1;
}

sub is_overdue {
    my $self = shift;
    my $now = HSDB4::DateTime->new;
    return 0 unless($self->due_date);
    # If it's overdue, return 1
    if ($now->out_unix_time > ($self->due_date->out_unix_time + 86400)) {
	return 1;
    }
    return 0;
}

sub is_notyetavailable {
    my $self = shift;
    my $now = HSDB4::DateTime->new;

    return 1 unless ($self->available_date());
    # If it's not yet available, return 1
    if ($now->out_unix_time < $self->available_date->out_unix_time) {
	return 1;
    }
    return 0;
}

sub get_submittable_date {
    my $self = shift();
    return $self->field_value('submittable_date');
}

sub set_submittable_date {
    my $self = shift();
    my $submittable_date = shift() or die "expected a date";
    $self->field_value('submittable_date', $submittable_date);
}

sub is_submittable {
    my $self = shift();

    return ( HSDB4::DateTime->new()->out_mysql_date() ge $self->get_submittable_date() );
}

sub is_available {
    #
    # Say whether an eval is available (by its date)
    #

    my $self = shift;

    return (1, '');
}

sub is_user_allowed {
    #
    # Say whether a user object is permitted to get to the eval
    #

    my $self = shift;
    # Read in the user
    my $user = shift;

    my $username = ref $user ? $user->primary_key : $user;

    # Start with date issues

    # If there's no available date, or if it's too early, return 0
    if (not $self->available_date or $self->is_notyetavailable) {
	return (0, sprintf ("Form is not available until %s",
			    $self->available_date->out_string_date));
    }

    # Right now, we don't really want to check if something is overdue and
    # thereby not allow access.
    # if (0) {
    if ($self->due_date and $self->is_overdue) {
	return (0, sprintf ("Form is no longer available (due %s)",
			    $self->due_date->out_string_date));
    }

    if (not $self->course()->is_user_registered($username,
						$self->field_value ('time_period_id'))) {
	return (0, sprintf("User %s is not registered for course %s during %s.",
			   $username, $self->course()->out_label(), 
			   $self->time_period()->out_label()));
    }

    # Check for the user having already completed the form
    my $comp = HSDB45::Eval::Completion->new( _school => $self->school() );
    $comp->lookup_key ($username, $self->primary_key);
    if ($comp->primary_key && $comp->field_value('status') eq 'Done') {
	return (0, sprintf ("User %s has already completed evaluation.",
			    $username));
    }

    # So it's all OK
    return (1, '');
}

sub users {
    my $self = shift;
    
    # Cache...
    unless ($self->{-users}) {
        # Set up the output list
	my @users;

    push @users, $self->link_enrolled_users();

	$self->{-users} = [ sort { $a cmp $b } @users ];
    }
    
    return @{$self->{-users}};
}

sub group_enrolled_users {
    my $self = shift;
    my @users = ();
    # take user groups, then get the users in them
    if ($self->course()->associate_user_group()) {
	my @groups = 
	    $self->course()->child_user_groups($self->field_value('time_period_id'));
	foreach (@groups) { 
	    push @users, 
	    grep { ! $self->admin_group()->contains_user($_) } $_->child_users();
	}
    }
    return @users;
}

sub link_enrolled_users {
    my $self = shift;

    my @user_ids = ();
    my $dbh = HSDB4::Constants::def_db_handle();
    my $db = $self->school_db();
    my $sql = qq[SELECT child_user_id
		 FROM $db\.link_course_student
		 WHERE parent_course_id=?
		 AND time_period_id=?];
    if (defined($self->field_value('teaching_site_id'))
	 && $self->field_value('teaching_site_id') ne ''){
		$sql .= " AND ( teaching_site_id IS NULL OR  teaching_site_id = "
			.$self->field_value('teaching_site_id') . " )";
	}
    eval {
	my $sth = $dbh->prepare($sql);
	$sth->execute($self->field_value('course_id'), 
		      $self->field_value ('time_period_id'));
	while (my ($user_id) = $sth->fetchrow_array) { push @user_ids, $user_id }
     $sth->finish;
    };

    my @users = ();
    for my $user_id (@user_ids) {
	next if $self->admin_group()->contains_user($user_id);
	push @users, HSDB4::SQLRow::User->new->lookup_key($user_id);
    }

    return @users;
}

sub num_users {
    my $self = shift;
    return scalar($self->users());
}

sub eval_completions {
    #
    # Get the completion objects associated with the eval
    #

    my $self = shift;

    # Form the conditions
    my @conds = (sprintf ("eval_id='%s'", $self->primary_key), @_,
		 'ORDER BY created DESC');
    # Return the results of the lookup
    my $blankcomp = HSDB45::Eval::Completion->new( _school => $self->school() );
    return $blankcomp->lookup_conditions (@conds);
}

sub is_editable {
    my $self = shift;
    if ($self->eval_completions()) { return 0 }
    my $db = $self->school_db();
    my $count = 0;
    eval {
	my $dbh = HSDB4::Constants::def_db_handle();
	my $sth = 
	    $dbh->prepare(qq[SELECT COUNT(*) FROM $db\.eval_response WHERE eval_id=?]);
	$sth->execute($self->primary_key());
	($count) = $sth->fetchrow_array();
     $sth->finish;
    };
    if ($@) {
	warn sprintf("Could not find the number of responses for eval_id=%d",
		     $self->primary_key());
    }
    return $count ? 0 : 1;
}

sub divide_users {
    #
    # Divide the suers into those who have completed and those who haven't
    #

    my $self = shift;
    # Check for cached results
    unless ($self->{-complete_users} && $self->{-incomplete_users}) {
	# Make a hash of the users who have completed the eval
	my %comp_hash = ();
	my ($complete_hash,$incomplete_hash) = ({},{});
	foreach my $eval_obj ($self->eval_completions()) {
	    $comp_hash{$eval_obj->field_value ('user_id')} = 1;
	}
	# Make the list to store the answers
	my @complete = ();
	my @incomplete = ();
	# Now for each user
	foreach my $user_obj ($self->users) {
	    # If the user's ID is in the comp_hash, put it on completes...
	    if ($comp_hash{$user_obj->primary_key}) { 
		push @complete, $user_obj ;
		$complete_hash->{$user_obj->primary_key} = $user_obj;
	    }
	    # Otherwise, put it on incompletes
	    else { 
		push @incomplete, $user_obj;
		$incomplete_hash->{$user_obj->primary_key} = $user_obj;
	    }
	}

	# Now, store the results in the cache
	$self->{-complete_users} = \@complete;
	$self->{-incomplete_users} = \@incomplete;
	$self->{-complete_users_hash} = $complete_hash;
	$self->{-incomplete_users_hash} = $incomplete_hash;
	
    }
    return;
}

sub complete_users {
    #
    # Get the set of complete users
    #

    my $self = shift;
    # Do the division unless the cache has the results
    $self->divide_users() unless $self->{-complete_users};
    # Return the cached result
    return @{$self->{-complete_users}};
}

sub incomplete_users {
    #
    # Get the set of incomplete users
    #

    my $self = shift;
    # Do the division unless the cache has the results
    $self->divide_users() unless $self->{-incomplete_users};
    # Return the cached result
    return @{$self->{-incomplete_users}};
}

sub save {
	my $self = shift;
        return $self->SUPER::save ($TUSK::Constants::DatabaseUsers{ContentManager}->{writeusername},$TUSK::Constants::DatabaseUsers{ContentManager}->{writepassword});
}

sub is_user_complete {
        my $self = shift;
        my $user = shift;
        die "User not passed to is_user_complete " if (!defined($user));
        die "User is not HSDB4::SQLRow::User" if (ref($user) ne 'HSDB4::SQLRow::User');
	my $cond = sprintf(" user_id = '%s' ", $user->user_id());

	# only expect one row for one eval and one user
	my ($comp) = $self->eval_completions($cond);
	return 0 if (!defined($comp));
	return 1 if (defined($comp->primary_key()));
        return undef;

}

sub validate_form {
    #
    # Read in a hash of key => value pairs and return the required fields
    # that aren't filled in
    #

    my $self = shift;
    my $fdat = shift;
    # Make a place to put the id's of problems
    my @problems = ();
    # Now go through the list of required questions...
    foreach my $q_id ($self->required_questions) {
	# ...and push the problem ID's onto the list
	push @problems, $q_id unless $fdat->{"eval_q_$q_id"};
    }
    # And return the whole list
    return @problems;
}

sub answer_form {
    #
    # Actually fill in all the user's answers
    #

    my ($self, $user, $fdat) = @_;

    # Make the user code
    my $code = $user->out_user_code ($fdat->{submit_password});

    my ($result, $msg) = (0, '');
    eval {
	# Go through the list of keys
	foreach my $key (keys %{$fdat}) {
	    next unless my ($q_id) = $key =~ /eval_q_(\d+)/;
	    my $resp = 
	      HSDB45::Eval::Question::Response->new ( _school => $self->school() );
	    $resp->primary_key ($code, $self->primary_key(), $q_id);
	    $resp->field_value ('response', $fdat->{$key});
	    my ($r, $msg) = $resp->save;
	    die "Could not save $q_id ($r) [$fdat->{$key}]: $msg" unless $r;
	}

	# Now do the completion token
	my $comp = HSDB45::Eval::Completion->new ( _school => $self->school() );
	$comp->primary_key ($user->primary_key, $self->primary_key);
	$comp->field_value ('status' => 'Done');
	my ($r, $msg) = $comp->save;
	die "Could not save the completion token: $msg" unless $r;

	# Phew! We got there.
	$result = 1;
    };
    die $@ if $@;
    return (1, '');
}

sub required_questions {
    #
    # Return the list of questions which are required
    #

    my $self = shift;
    return ( map { $_->primary_key }
	     grep { $_->is_required }
	     $self->questions );
}


sub out_html_row {
    # 
    # A four-column HTML row
    #

    my $self = shift;
    my $outval = "<td>" . $self->out_html_label . "</td>";
    $outval .= "<td>" . $self->course->out_html_label . "</td>";
    $outval .= "<td>";
    $outval .= $self->available_date->out_string_date_short
      if $self->available_date;
    $outval .= "</td>";
    $outval .= "<td><b>Due: </b>";
    $outval .= $self->due_date->out_string_date_short 
      if $self->due_date;
    $outval .= "</td>";
    return "<tr>$outval</tr>";
}

sub out_label {
    #
    # A label for the object: its title
    #

    my $self = shift;
    return $self->field_value('title');
}


sub out_abbrev {
    #
    # An abbreviation for the object: the first twenty characters of its
    # title
    #

    my $self = shift;
    return $self->field_value ('title');
}


# spreads out the sort_order values of questions to have a padding of ten
sub reapportion_orderings {
    my ($self, $user, $password) = @_;

    my $sort_order = 0;
    foreach my $question ($self->questions()) {
	$sort_order += 10;
	$self->update_child_question_link($user, $password,
					  $question->primary_key(),
					  ('sort_order', $sort_order));
    }
}

# returns the ID of the question that precedes the question with ID
# $qid within the context of this eval...  since caching of questions
# does not yet occur, this is a painfully inefficient operation, but
# it doesn't happen much so getting too uppity and writing raw SQL
# would probably be premature optimization, the root of all evil
sub get_preceding_qid {
    my ($self, $qid) = @_;

    my $last_qid = 0;
    foreach my $question ($self->questions()) {
	return $last_qid if $question->primary_key() == $qid;
	$last_qid = $question->primary_key();
    }

    die "did not find question (ID=$qid)";
}

sub automate_all_labels {
    my ($self) = shift;

    my ($username,$password) = ($TUSK::Constants::DatabaseUsers{ContentManager}->{writeusername},$TUSK::Constants::DatabaseUsers{ContentManager}->{writepassword});
    my $type;
    foreach my $q ($self->questions()) {
	$type = $q->body()->question_type();
	if (($type ne 'Title' ) 
	       && ($type ne 'TeachingSite')
               && ($type ne 'Instruction')){
	   $self->update_child_question_link($username,$password,$q->primary_key(),
		'label'=>'auto' );
	}
    }
}

sub count_users {
    my $self = shift;
    my $count = 0;
    my $db = $self->school_db();
    my $sth;

    eval {
	my $dbh = HSDB4::Constants::def_db_handle();
	my $admin_group_id = HSDB4::Constants::get_eval_admin_group($self->school());
    $sth = $dbh->prepare(qq(
		SELECT count(child_user_id) 
		FROM $db\.link_course_student a, $db\.eval b 
		WHERE parent_course_id = course_id 
		and a.time_period_id = b.time_period_id 
		and b.time_period_id = ?
		and eval_id = ?
		and a.teaching_site_id = b.teaching_site_id
		and b.teaching_site_id = ? 
	        AND child_user_id not in 
		    (select child_user_id 
		    from $db\.link_user_group_user 
		    where parent_user_group_id = $admin_group_id)
	    ));
    $sth->execute($self->field_value('time_period_id'), $self->primary_key(), $self->field_value('teaching_site_id'));

	$count = $sth->fetchrow_array();
	$sth->finish();
    };

    if ($@) {
	warn sprintf("Could not find the number of all users for eval_id=%d",
		     $self->primary_key());
    }

    return $count;
}


sub count_complete_users {
    my $self = shift;
    my $count = 0;
    my $db = $self->school_db();

    eval {
        my $admin_group_id = HSDB4::Constants::get_eval_admin_group($self->school());
	my $dbh = HSDB4::Constants::def_db_handle();
	my $sth = $dbh->prepare(qq(
				select count(*) 
				from $db\.eval_completion 
				where eval_id = ?
				AND user_id not in 
                           		(select child_user_id 
				    	from $db\.link_user_group_user 
			    		where parent_user_group_id = $admin_group_id)
				));

	$sth->execute($self->primary_key());
	$count = $sth->fetchrow_array();
	$sth->finish();
    };

    if ($@) {
	warn sprintf("Could not find the number of complete users for eval_id=%d",
		     $self->primary_key());
    }

    return $count;
}


1;
__END__
