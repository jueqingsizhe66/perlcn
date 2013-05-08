#!/usr/bin/perl

use strict;
use warnings;

my  $text ;

while($text = <>){
    $text =~ m{
        ^ \w+ =
        #now read the capture value
        (
            (?> [^\n\\]*)  # normal* value
            (?> \\. [^\n\\]*)* #(special* normal*)*
        )
    }gix;
    print $text;
}
