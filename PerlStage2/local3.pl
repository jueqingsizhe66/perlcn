#!/usr/bin/perl
use strict;
use warnings;
#很好的讲述了 本地化的运行机制！！！
my $Count = undef;
our $TmpCount = 0;
my $text = "124 jfdsd34 535txt 34 553fdf";
$text =~m{
    ^(?> \d+ (?{local($TmpCount) = $TmpCount + 1})\b |\w+|\s+)+ $
    (?{$Count = $TmpCount}) #finally put the $TmpCount into $Count
}x;
if(defined $Count){
    print "Count is $Count.\n";
}else{
    print "no match.\n"
}
