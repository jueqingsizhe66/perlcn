#!/usr/bin/perl -w
use strict;
use warnings;

"abcdedfg" =~ m{
    (?{print "Start matching at [$`|$']\n"})
    (?:d|e|f)
}x;
