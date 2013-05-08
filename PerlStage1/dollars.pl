#!/usr/bin/perl
use strict;
use warnings;

#---version1---# my $pop = <>;
#---version1---# $pop =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g;
#---version1---# print "The US population is $pop";
#----Here there are some bugs!
#F:\>perl -w dollars.pl
#34340349304
#The US population is 34,340,349,304
#
#F:\>perl -w dollars.pl
#4529053,3434
#The US population is 4529053,3,434

#---version2---#
#my $text = "The population of 3431531535 is growing";
#
#$text =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g;  #because $ is  on the tail of the string
#print $text;

#---version3---#
my $text = "The population of 3431531535 is growing";

$text =~ s/(?<=\d)(?=(?:\d\d\d)+(?!\b))/,/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text,"\n";


$text = "The population of 3431531535 is growing";

$text =~ s/(\d)(?=(?:\d\d\d)+(?!\b))/$1,/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text,"\n";

$text = "The population of 3431531535 is growing";

$text =~ s/(\d)((\d\d\d)+\b)/$1,$2/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text,"\n";


$text = "The population of 3431531535 is growing";

$text =~ s/(?<=\d)((?>\d\d\d)+(?!\b))/,/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text,"\n";

$text = "The population of 3431531535 is growing";

$text =~ s/(?>(?<=\d)(?=(?>\d\d\d)+(?!\b)))/,/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text,"\n";

$text = "The population of 3431531535 is growing";

$text =~ s/(?<=\d)((?>\d\d\d)+?(?!\b))/,/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text,"\n";


$text = "The population of 3431531535 is growing";

$text =~ s/(?>(?<=\d)((?>\d\d\d)+(?!\b)))/,/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text;
print "\n";


$text = "The population of 4344.34535  34.342 is growing";

#在原子组合里面放进行lazy算法简直就是扯淡？ 简直就是浪费资源  因为原子组合一跳出他的right closing parent 就直接跳走了！
#但是？ 选择性的倒是可以的
$text =~ s/(\.\d\d(?>[1-9]?))\d+/$1/g; # (?!\b) is not the same with \D because behind the \D must be some character,not (?\b)
print $text;
print "\xU+1D121";
print "\x{1D121}";
print "\x{FFFF},\x{000A},\x{3f13}";
print "helo \x{000D} world \x{000B},it really world \x{2029}";
print "\x{000A} yes! Now I can type the special words! you see --->\x{0061}\x{0300} \x{000B} \x{0049} \x{00CF}\x{03AA) \x{000B} \x{0049}\x{0308} \x{000B} \x{0399}\x{0308} \x{000B} \x{C0B5} \uC0B5";
