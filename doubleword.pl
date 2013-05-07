#!/usr/bin/perl
use strict;
use warnings;
use encoding 'gb2312', STDIN=>'gb2312',STDOUT=>'gb2312';

$/ = ".\n";
while(<>){
    next if !s/\b([a-zA-Z]+)((?:\s|<[^>]+>)+)(\1\b)/\e[7m$1\e[m$2\e[7m$3\e[m/ig;
    s/^(?:[^\e]*\n)+//mg;
    s/^/$ARGV: /mg;
    print;
}
