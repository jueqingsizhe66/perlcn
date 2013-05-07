#!/usr/bin/perl -w
use strict;
use warnings;

my $given = "Tom";
my $family = "Cruise";
my $wunderprize = "100% genuine faux diamond";

my $letter ;
while($letter = <>){ # while <> will read each line from the file !yes that's what I wnat
$letter =~ s/=FIRST=/$given/g;
$letter =~ s/=FAMILY=/$family/g;
$letter =~ s/=SUCKER=/$given $family/g;
$letter =~ s/=TRINKET=/fabulous $wunderprize/g;
print $letter;
}
