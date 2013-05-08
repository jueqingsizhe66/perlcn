#!/usr/bin/perl -w
use warnings;
use strict;

# $ perl -w removeleadingpath.pl 
#usr/bin/fd/gvv

my $text = <>;
#$text =~ s{(^.*/)}{}igx;

#$text =~ m{([^/]*)}igx;
#my $Filename = $1;
my $Filename;
#$text =~ s{(^.*//)}{}igx;  #for windows because need //

print $text,"\n";
#print "filename is ",$Filename;
my $LeadingPath;
if($text =~ m{(.*)/([^/]*)}igx){
    $LeadingPath = $1;
    $Filename = $2;
}else{
    # cannot match
    $LeadingPath = ".";
    $Filename = $text;
}

print "LeadingPath is $LeadingPath , while Filename is $Filename!\n";
