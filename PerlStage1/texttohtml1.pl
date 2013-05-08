#/usr/bin/perl
use strict;
use warnings;

undef $/; #Enter "file-slurp" mode
my $text = <>; # slurp up  the first file given on the command line

$text =~ s/&/&amp;/g;  #mark the basic html
$text =~ s/</\&lt;/g; #  
$text =~ s/>/\&gt;/g; 


$text =~ s/^\s*$/<p>/g;#seperate paragraph 

# turn email addresses into links
$text =~ s{
   \b
   # capture the address to $1...
   (
        \w[-.\w]*  #username
        \@
        [-a-z0-9]+(\.[-a-z0-9]+)*\.(com|edu|info) #hostname
   )
   \b
}{<a href = "mailto: $1">$1</a>}gix;

#print $text;  #Finally display the result

$text =~ s{
    \b 
    #capture the url to $1
    (
        http:// [-a-z0-9]+(\.[a-z0-9]+)*\.(com|edu|info) \b #hostname 
        (
            / [-a-z0-9_:\@&?=+,.!/~*'%\$]* #optional path
              (?<![.,?!]) #not allowed to end with [.,?!]
        )?
    )
}{<a href="$1">$1</a>}gix;

print $text; # finally display the result
