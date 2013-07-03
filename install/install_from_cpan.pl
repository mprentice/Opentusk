#!/usr/bin/env perl

use CPAN;

exit main(@ARGV) unless caller;

sub main {
    local @ARGV = @_;

    if (scalar @ARGV > 0 && $ARGV[0] eq '--help') {
        print usage();
        return;
    }

    my $package_list_file = $ARGV[0];

    while (my $pkg = <>) {
        chomp $pkg;
        next if $pkg =~ m/^ *#/;
        system('cpanm', $pkg) or die "Error installing $pkg: $!";
    }
}

sub usage {
    return <<END_HELP;
Usage: perl install_from_cpan.pl <package-list-file>
Example:
  cd install
  ./install_from_cpan.pl perl-packages.txt
END_HELP
}
