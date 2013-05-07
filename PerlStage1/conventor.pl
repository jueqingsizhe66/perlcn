#!/bin/usr/perl

use strict;
use warnings;

print "Please Enter the number eg:100c or 30F ...";

my $input = <STDIN>; #this reads one line from the user
chomp($input); # this removes the ending newline from $input

if($input =~ m/^([-+]?[0-9]+(?:\.[0-9]*)?)\s*([CF])$/i)
{
    #if we get in here,we had a match,$1 is the number,$2 is the unit 
    my $InputNum = $1;
    my $Type = $2;
    my $celsius; 
    my $Fahrenheit; 
    if($Type =~ m/c/i){
        #the input was celsius,so calculate the Fabrenheit
        $celsius = $InputNum;
        $Fahrenheit = ($celsius * 9 / 5) + 32;
    }else{
        #If not "c" it must be "f",so calculate the celsius 
         $Fahrenheit = $InputNum;
         $celsius = ($Fahrenheit - 32) *5 /9;
    }
    # at this point we have both temperature so display the result
    printf "%.2f c is %.2f F \n",$celsius, $Fahrenheit;
}else{
    #the initial regex did not match ,so issue a warning;
    print "Expecting a number followed by \"C\" or \"F\",\n";
    print "so i don't understand \"$input \". \n";
}

