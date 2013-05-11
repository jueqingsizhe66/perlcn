#!/usr/bin/perl
use warnings;
use strict;

sub CheckOptimizer{
    my $text = shift; #text
    my $start = undef ; #record the first position when exp applied
    my $match = $text=~m{
        (?{$start = $-[0] if not defined $start}) #save the first applied po
        \d # test
    }x;
    if (not defined $start){
        print "The Whole match was optimized away.\n";
    }elsif($start == 0){
        print "The match start was not optimized.\n"; 
    }else{
        print "The optimizer started the match at character $start.\n"; 
    }
}

CheckOptimizer("test 123");

#root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop?
#$ perl -w myregex.pl 
#Variable "$start" will not stay shared at (re_eval 1) line 1.
#The Whole match was optimized away.

