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


package TUSK::Constants;

use strict;
use Carp;
use Readonly;

use Sys::Hostname;

use Poet qw($conf);

Readonly my $EMPTY => q{};

# SiteWide
our $Domain = $conf->get('SiteWide.Domain' => hostname());
our $SiteAbbr = $conf->get('SiteWide.SiteAbbr' => 'OpenTUSK');
our $SiteName = $conf->get('SiteWide.SiteName' => 'OpenTUSK');
our %Institution = %{ $conf->get_hash('SiteWide.Institution') };
our $CopyrightOrg = $conf->get('SiteWide.CopyrightOrg' => 'OpenTUSK');
our $UniqueID = $conf->get('SiteWide.UniqueID' => 'StudentID');
our $Logo = $conf->get('SiteWide.Logo' => '/graphics/opentusk_logo.jpg');
our $flvplayer_skin_color
    = $conf->get('SiteWide.flvplayer_skin_color' => '999999');
our $GuestUserName = $conf->get('SiteWide.GuestUserName' => 'OpenTUSK-Guest');
our $DefaultDB = $conf->get('SiteWide.DefaultDB' => 'hsdb4');
our @siteAdmins = @{ $conf->get_list('SiteWide.siteAdmins') };
our $SystemWideUserGroup = $conf->get('SiteWide.SystemWideUserGroup' => 666);
our $SystemWideUserGroupSchool
    = $conf->get('SiteWide.SystemWideUserGroupSchool' => 'Default');
our @Degrees = @{ $conf->get_list('SiteWide.Degrees') };
our @Affiliations = @{ $conf->get_list('SiteWide.Affiliations') };
our %Schools = %{ $conf->get_hash('SiteWide.Schools') };
our $WebError = $conf->get( 'SiteWide.WebError' => <<"END_WEB_ERROR" );
<p>The page you requested is having trouble getting from our server to your web browser.</p>
<p>Your problem has been reported to $SiteAbbr and we will do our best to help you with this issue.
If you would like to contact us with additional information please email
<a href="mailto:$Institution{Email}">$Institution{Email}</a>
or call $Institution{Phone}.  Thank you for your patience.
END_WEB_ERROR

# # Path
our $MasonCacheRoot = $conf->get('Path.MasonCacheRoot' => '/var/cache/mason');
our $ServerRoot = $conf->get('Path.ServerRoot' => '/usr/local/tusk/current');
our $CodeRoot = $conf->get('Path.CodeRoot' => "$ServerRoot/code");
our $LogRoot = $conf->get('Path.LogRoot' => '/var/log/tusk');
our $XSLRoot = $conf->get('Path.CodeRoot' => "$CodeRoot/code");
our $XMLRulesPath = $conf->get('Path.XMLRulesPath' => "$CodeRoot/HSCML/Rules");
our $MySQLDir = $conf->get('Path.MySQLDir' => '/usr/bin');
our $DataPath = $conf->get('Path.DataPath' => '/data');

# # Communication
# our $ErrorEmail = $conf->get('Communication.ErrorEmail' => "error\@$Domain");
# our $PageEmail = $conf->get('Communication.PageEmail' => "pager\@$Domain");
# our $FeedbackEmail
#     = $conf->get('Communication.FeedbackEmail' => "feedback\@$Domain");
# our $SupportEmail
#     = $conf->get('Communication.SupportEmail' => "support\@$Domain");
# our $AdminEmail = $conf->get('Communication.AdminEmail' => "admin\@$Domain");
# our $HomepageMessage = $conf->get('Communication.HomepageMessage' => $EMPTY);
# our $PrivacyNotice = $conf->get('Communication.PrivacyNotice' => $EMPTY);
# our $SendEmailUserWhenNoAffiliationOrGroup
#     = $conf->get_boolean('Communication.SendEmailUserWhenNoAffiliationOrGroup');
# our $emailWhenNewUserLogsIn
#     = $conf->get_boolean('Communication.emailWhenNewUserLogsIn');
# our $ExternalPasswordReset
#     = $conf->get_boolean('Communication.ExternalPasswordReset');
# our $ContactURL
#     = $conf->get('Communication.ContactURL' => '/about/contact_us');
# my $AddressText = join("\n", @{ $Institution{Address} });
# our $EmailUserWhenNoAffiliationOrGroupText
#     = $conf->get(
#         'Communication.EmailUserWhenNoAffiliationOrGroupText' => <<"END_TEXT"
# Hello and thank you for using the $SiteAbbr system. We were unable to
# determine the school or group with which you are affiliated. Please
# reply to this email and let us know your school affiliation and, if
# you are a student, please include your year of graduation.

# $SiteAbbr Support
# $Institution{Email}
# $Institution{Phone}
# $AddressText
# END_TEXT
#     );

# # User
# our $UserImagesPath = $conf->get('User.UserImagesPath' => '/images/users');

# # Content
# our $PDFTextExtract
#     = $conf->get('Content.PDFTextExtract' => '/usr/bin/pdftotext');
# our $PPTServiceEnabled = $conf->get_boolean('Content.PPTServiceEnabled');
# our $TUSKdocServiceEnabled
#     = $conf->get_boolean('Content.TUSKdocServiceEnabled');
# our $BasePPTPath = $conf->get('Content.BasePPTPath' => "$DataPath/ppt");
# our $BaseTUSKDocPath
#     = $conf->get('Content.BaseTUSKDocPath' => "$DataPath/TUSKdoc");
# our $FeedPath = $conf->get('Content.FeedPath' => "$DataPath/feeds");
# our $TempPath = $conf->get('Content.TempPath' => "$DataPath/temp");
# our $BaseStaticPath = $conf->get('Content.BaseStaticPath' => "$DataPath/html");
# our $BaseStreamPath
#     = $conf->get('Content.BaseStreamPath' => "DataPath/streaming");
# our $FOPXMLPath
#     = $conf->get('Content.FOPXMLPath' => "$BaseStaticPath/fop-xml");
# our $FOPPDFPath
#     = $conf->get('Content.FOPPDFPath' => "$BaseStaticPath/fop-pdf");

# # Schedule
# our $ScheduleMonthsDisplayedAtOnce
#     = $conf->get('Schedule.ScheduleMonthsDisplayedAtOnce' => 6);
# our $ScheduleDisplayMonthsInARow
#     = $conf->get('Schedule.ScheduleDisplayMonthsInARow' => 1);
# our $icsTimeZoneFile
#     = $conf->get('Schedule.icsTimeZoneFile' => 'America.New_York');

# # Forum
# our $AttachUrlPath = $conf->get('Forum.AttachUrlPath' => '/forum_attachments');
# our $EmailProgram = $conf->get('Forum.EmailProgram' => '/usr/lib/sendmail -t');
# our $ForumAnimatedAvatar = $conf->get_boolean('Forum.ForumAnimatedAvatar');
# our $ForumAttachments
#     = $conf->get('Forum.ForumAttachments' => "$DataPath/forum_data");
# our $ForumPolicy = $conf->get('Forum.ForumPolicy' => $EMPTY);
# our $MaxAttachLen = $conf->get('Forum.MaxAttachLen' => 10000000);
# our $ForumEmail = $conf->get('Forum.ForumEmail' => $Institution{Email});
# our $ForumName = $conf->get('Forum.ForumName' => "$SiteAbbr Forum");
# our $HomeUrl = $conf->get('Forum.HomeUrl' => $EMPTY);
# our $HomeTitle = $conf->get('Forum.HomeTitle' => $SiteAbbr);
# our $ScriptUrlPath = $conf->get('Forum.ScriptUrlPath' => '/forum');
# our $ForumPolicyTitle
#     = $conf->get('Forum.ForumPolicyTitle' => "$ForumName Policy");
# our $userTimezone = $conf->get('Forum.userTimezone' => -5);
# our $Mailer = $conf->get('Forum.Mailer' => 'sendmail');

# # Tracking
# our $UseTracking = $conf->get_boolean('Tracking.UseTracking');
# our $TrackingString = $conf->get('Tracking.TrackingString');

# # Links
# our $AboutURL
#     = $conf->get('Links.AboutURL' => 'http://opentusk.org/about.html');
# our %LoginPage = %{ $conf->get_hash('Links.LoginPage') };
# our @FooterLeft = @{ $conf->get_list('Links.FooterLeft') };
# our @FooterRight = @{ $conf->get_list('Links.FooterRight') };

# # Authentication
# our %LDAP = %{ $conf->get_hash('Authentication.LDAP', { UseLDAP => 0 }) };
# our $useShibboleth = $conf->get_boolean('Authentication.useShibboleth');
# our @PermissibleIPs = @{ $conf->get_list('Authentication.PermissibleIPs') };

# # Authorization
# our %DatabaseUsers = %{ $conf->get_hash('Authorization.DatabaseUsers') };

# # Security
# our $CookieSecret = $conf->get('Security.CookieSecret');
# our $CookieUsesUserID = $conf->get_boolean('Security.CookieUsesUserID');
# our $RssSecret = $conf->get('Security.RssSecret');

# # Help
# our $HelpURLRoot = $conf->get(
#     'Help.HelpURLRoot' => 'http://help.tusk.tufts.edu/doku.php?id=current:' );

# # Middleware
# our %Servers = %{ $conf->get_hash('Middleware.Servers') };
# our %Databases = %{
#     $conf->get_hash(
#         'Middleware.Databases',
#         {
#             mwforum => 'mwforum',
#             fts => 'fts',
#             hsdb4 => 'hsdb4',
#             tusk => 'tusk',
#         }
#     )
# };

# # HTTPD
# our $maxApacheProcSize = $conf->get('HTTPD.maxApacheProcSize' => 92160);
# our $securePort = $conf->get('HTTPD.securePort' => 443);

# # case simulator (legacy)
# our $release_stamp_3_6_1 = 1;

# # Evaluation
# our $EvalSaveDir
#     = $conf->get('Evaluation.EvalSaveDir' => "$DataPath/eval_data");
# our $evalErrorMessage = $conf->get('Evaluation.evalErrorMessage' => $EMPTY);
# our @evalGraphicsFormats = ('png', 'jpeg', 'gif');
# our $EvalDTD = $conf->get( 'Evaluation.EvalDTD' => <<"END_DTD" );
# <?xml version="1.0"?><!DOCTYPE question_text SYSTEM "http://$Domain/DTD/eval.dtd">
# END_DTD

1;
