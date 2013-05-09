
#!/usr/bin/perl -w
use warnings;
use strict;

#my $text = <>;
my $text = '"/-|-\\\" or "[^-^]" you are \er ';
$text =~ m{
    (?{print "The starting match is $`||$'"})
    ("(\\.|[^"])*")
}gix;

