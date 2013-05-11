#!/usr/bin/perl -w

use warnings;
use strict;

my $zip;
my @zips = ();
$_ = <>; # while with $_ so can dispose the file from outer
while(m/\G(\d\d\d\d\d)/g){
    $zip = $1;
    if( substr($zip,0,2) eq "44"){
        push @zips,$zip; 
    }
}
foreach (@zips){
    print;
    print "\\\\";
}
