#!/usr/bin/perl -w
use warnings;
use strict;

#my $text = <>;
my $text = '"/-|-\\\" or "[^-^]"';
$text =~ m{
    (?{print "The starting match is $`||$'"})
    ("([^"]|(?<=\\)")*")
}gix; # leave off gix
# =~的意思：$string = "I love perl";  只取着传递信息的作用
#
# $string =~ s/(love)/<$1>;/; # 此时 $1 = "love"，并且该替换的结果是将 $string 变为 "I <love>; perl""
print "s之前的$text\n";
if($text =~ m/"([^"]|(?<=\\)")*"/gix){
    $text = $1;
    print $text,"\n";
}
print "m之后的$text\n";

$text =~ s/"([^"]|(?<=\\)")"/$1,,,,/g;
print "正确s 之后的结果",$text,"\n";

$text = '"/-|-\\" or "[^-^]"';
$text =~ s/"([^"]|(?<=\\)")*"/$1,,,/g;
print "错误s *之后的结果",$text,"\n";
#if($text =~ m/"([^"]|(?<=\\)")*"/g){
#    print $text,"\n";
#}


$text = '"You need a 2\"x3\" photo"';
if($text =~ m/"([^"]|(?<=\\)")"/igx){
    $text = $1;
    print $text,"\n";
}


$text = '"You need a 2\"x3\" photo"';
if($text =~ m/((?:[^"]|\\.)+p)/g){  #get to what I want~~
    print $text,"\t I need\n" ;
    print $1,"\t ye!";
    }
