#!/usr/bin/perl
use strict;
use warnings;

my $NestedGuts = qr{

    (?{local $OpenParens = 0}) #cal the unclose the (
    (?> # atom group ,to promote the efficiency
    # other character except ()
    [^()]+
    # opening parenthese
    | \( (?{$OpenParens++})
    # the closing parenthese
    | \) (?(?{ $OpenParens != 0}) (?{$OpenParens--})|(?!) )
#如果已经==0 了就强制失败
    )*
    )
    (?{?{$OpenParens != 0}} (?!)) # match failed
}x;
