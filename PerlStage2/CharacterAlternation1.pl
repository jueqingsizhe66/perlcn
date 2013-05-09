#!/usr/bin/perl -w
use warnings;
use strict;
use Time::HiRes 'time'; #so the time() will be more accurate

my $TestToDo = 1000; # test try 1000 times
my $TestString = "abababdedfg";
$TestString = $TestString x 1000; # generate the long strings
# is x  not *  Take note!
#print $TestString;
my $Count = $TestToDo;
my $StartTime = time();
while($Count-- > 0){
$TestString =~ m/^(a|b|c|d|e|f|g)+$/ig;
}
my $EndTime = time();
printf("Alternation takes %.3f seconds.\n",$StartTime-$EndTime);

$Count = $TestToDo;
$StartTime = time();
while($Count-- > 0){
$TestString =~ m/^[abcdefg]+$/ig;
}
$EndTime = time();
printf("character class takes %.3f seconds.\n",$StartTime-$EndTime);


