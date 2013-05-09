#!/usr/bin/perl -w
use warnings;
use strict;
use Time::HiRes 'time'; #so the time() will be more accurate

my $StartTime = time();
"abababdedfg" =~ m/^(a|b|c|d|e|f|g)+$/ig;
my $EndTime = time();
printf("Alternation takes %.24f seconds.\n",$StartTime-$EndTime);

$StartTime = time();
"abababdedfg" =~ m/^[abcdefg]+$/ig;
$EndTime = time();
printf("character class takes %.24f seconds.\n",$StartTime-$EndTime);

#所以一般是位数多一点好！  不然就会出现误差了 甚至是错误的结果
#24wei
##root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop?
##$ perl characterAlteration.pl 
##Alternation takes -0.000006914138793945312500 seconds.
##character class takes -0.000004053115844726562500 seconds.


###16wei
##root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop?
##$ perl characterAlteration.pl 
##Alternation takes -0.0000069141387939 seconds.
##character class takes -0.0000040531158447 seconds.

###6wei
##root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop?
##$ perl characterAlteration.pl 
##Alternation takes -0.000009 seconds.  #错误的结果
##character class takes -0.000004 seconds.
##
### 9wei
##root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop?
##$ perl characterAlteration.pl 
##Alternation takes -0.000010014 seconds.
##character class takes -0.000015020 seconds.
##
