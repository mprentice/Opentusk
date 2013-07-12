#!/usr/bin/env perl

# Tests for TUSK web application.

use Test::More;
use Plack::Test::Agent;

my $app = sub { return [ 200, 'ok']; };
