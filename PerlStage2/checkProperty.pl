#!/usr/bin/perl

use strict;
use warnings;
#  The easy benchmark
#
#use Time::HiRes;
#my $start = Time::HiRes::time();
#......
#my $delta = Time::HiRes::time() - $start;
#printf "took %.1f seconds\n",$delta
use Time::HiRes;
sub checkNaughtiness()
{
    my $text = 'x' x 10000; # create some data

    #calc the pure cycle cost
    my $start = Time::HiRes::time();
    for(my $i = 0; $i < 5000; $i++){}
    my $overhead = Time::HiRes::time()- $start;

    #calc the cycle+match cost
    $start = Time::HiRes::time();
    for(my $i = 0; $i < 5000; $i++){ $text =~  m/^/}
    my $delta = Time::HiRes::time() - $start;

    #calc the diff
    printf "It seems your code is %s (overhead = %.10f,
    delta = %.10f)\n",($delta>$overhead*5)?"nauthy":"clean",
    $overhead,$delta;
    
}
sub checkNaughtinessM()
{
    my $text = 'xsuu:fsfsdfsdf' x 10000; # create some data

    #calc the pure cycle cost
    my $start = Time::HiRes::time();
    for(my $i = 0; $i < 5000; $i++){$text =~ m/(\w+):/g}
    my $overhead = Time::HiRes::time()- $start;

    #calc the cycle+match cost
    $start = Time::HiRes::time();
    for(my $i = 0; $i < 5000; $i++){ $text =~  m/(?>\w+):/}
    my $delta = Time::HiRes::time() - $start;

    #calc the diff
    printf "It seems your code is %s (overhead = %.10f,
    delta = %.10f)\n",($delta>$overhead*5)?"nauthy":"clean",
    $overhead,$delta;
    
}
checkNaughtiness();
checkNaughtinessM();
