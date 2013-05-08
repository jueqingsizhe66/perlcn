#!/usr/bin/perl

use strict;
use warnings;

while(my $text = <>){
    if($text =~ m/^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/gxi){
    print "1--->  ",$text,"\n";
    }

    if($text =~ m{^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$}ixg){
    print "2---->  ",$text,"\n";
    }

    if($text =~ m{^\d+\.\d+\.\d+\.\d+$}igx){
    print "3---->  ",$text,"\n";
    }
    
    # the fixed number 
    if($text =~ m{^\d\d\d\.\d\d\d\.\d\d\d\.\d\d\d$}igx){
    print "4---->  ",$text,"\n";
    }

    if($text =~ m{^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$}igx){
    print "5---->  ",$text,"\n";
    }

    if($text =~ m{^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}(?<![\w.])}igx){
#(?<![\w.])  unrolling 1.2.3.4.5.6 but $ can do it yeah!
    print "5---->  ",$text,"\n";
    }

    if($text =~ m{^(?!0+\.0+\.0+\.0+$)([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])(?<![\w.])$}igx){
    print "6---->  ",$text,"\n";
    }


    

}
