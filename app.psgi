#!/usr/bin/env plackup

use HTML::Mason::PlackHandler;
use Plack::Builder;
use lib './lib';

$ENV{TUSKRC} = "$ENV{PWD}/conf/tusk.conf";

my $mason = HTML::Mason::PlackHandler->new(
    comp_root => "$ENV{PWD}/code/tusk",
);

builder {
    mount "/" => sub {
        my $env = shift;
        $mason->handle_request($env);
    }
};
