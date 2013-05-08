#!/usr/bin/perl

use warnings;
use strict;
# you can use with : perl -w texttohtml2.pl chox.txt
my $hostnameRegex = qr/[-a-z0-9]+(\.[-a-z0-9]+)*\.(com|edu|info)/i;
# qr// is similar to m// s// ,but the main function of it is chanslate it into the regex object
#Turn email address into links
undef $/;
my $text = <>;
$text =~ s{
    \b
    #capture the address to $1
    (
        \w[-.\w]*  #username
        \@
        $hostnameRegex  #hostname
    )
    \b
}{<a href = "mailto:$1">$1</a>}gix;

#Turn HTTp URLs into links....
$text =~ s{
    \b
    # Capture the URLs to $1
    (
        http:// $hostnameRegex \b  #hostname
        (
            / [-a-z0-9_:\@&?=+,.!/~*'\$]*  #optional path
            (?<![,.?!])  # not allowed to end with [,.?!]
        )?
    )
}{<a href = "$1">$1</a>}gix;

print $text;
