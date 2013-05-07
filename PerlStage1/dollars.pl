#!/usr/bin/perl
use strict;
use warnings;

#---version1---# my $pop = <>;
#---version1---# $pop =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g;
#---version1---# print "The US population is $pop";
#----Here there are some bugs!
#F:\>perl -w dollars.pl
#34340349304
#The US population is 34,340,349,304
#
#F:\>perl -w dollars.pl
#4529053,3434
#The US population is 4529053,3,434

#---version2---#
#my $text = "The population of 3431531535 is growing";
#
#$text =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g;  #because $ is  on the tail of the string
#print $text;

#---version3---#
my $text = "The population of 3431531535 is growing";

$text =~ s/(?<=\d)(?=(?:\d\d\d)+(?!\b))/,/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text;
