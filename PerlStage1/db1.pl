#!/bin/usr/perl
use strict;
use warnings;
# you should use lie:  perl -w finddb1 ch01.txt
#ch01.txt contain some literal message
$/ = ".\n";#$/ 当前输入记录分隔符,默认情况是新行 
while(<>){
    next if !s/\b([a-z]+)((?:\s|<[^>]+>)+)(\1\b)/\e[7m$1\e[m$2\e[7m$3\e[m/ig;
    s/^(?:[^\e]*\n)+//mg; #remove any unmarked lines
    s/^/$ARGV: /mg;  #Ensure line begin with filename
    print;
}
