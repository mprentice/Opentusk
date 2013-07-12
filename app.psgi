#!/usr/bin/env plackup

use HTML::Mason::PlackHandler;
use Plack::Builder;
use Plack::App::File;
use lib './lib';

$ENV{TUSKRC} = "$ENV{PWD}/conf/tusk.conf";

my $mason_app = HTML::Mason::PlackHandler->new(
    comp_root => "$ENV{PWD}/code/tusk",
);

my $styles_app = Plack::App::File->new(
    root => "$ENV{PWD}/code/style",
)->to_app;

my $scripts_app = Plack::App::File->new(
    root => "$ENV{PWD}/code/scripts",
)->to_app;

my $graphics_app = Plack::App::File->new(
    root => "$ENV{PWD}/graphics",
)->to_app;

my $icons_app = Plack::App::File->new(
    root => "$ENV{PWD}/graphics/icons",
)->to_app;

builder {
    mount "/style"    => $styles_app;
    mount "/graphics" => $graphics_app;
    mount "/icons"    => $icons_app;
    mount "/scripts"  => $scripts_app;
    mount "/" => sub {
        my $env = shift;
        $mason_app->handle_request($env);
    };
};
