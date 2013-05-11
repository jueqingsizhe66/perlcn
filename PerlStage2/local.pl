#!/usr/bin/perl

use warnings;
use strict;

#the experiment 1:
my $Count = 0;
my $text = "123 abc 73 xyz";
# experience 123space 表示1次
# 而如果123xyz 之类的就要让$Count++执行两次了 因为是回溯！所以2次
$text =~ m{
    ^(?>
        \d+(?{$Count++})\b|\w+|\s+    
     )*
     $
}x;
print "The number of the (\d and \b 在字符租内部是回车符) is $Count \n";
# (?>)固化分组仅仅是为了避免无休止匹配 但不会影响
# 结构内部的回溯 只会影响重新进入此结构的回溯，
# 这个结构就是固化分组 结构 他也是一个微型的小世界
#
#the experiment 2：
my $Count = 0;
my $text = "123 abc 73xyz 23xyz";
# experience 123space 表示1次
# 而如果123xyz 之类的就要让$Count++执行两次了 因为是回溯！所以2次
$text =~ m{
    ^(?>
        \d+(?{$Count++})\b|\w+|\s+    
     )*
     $
}x;
print "The second time:The number of the (\d and \b 在字符租内部是回车符) is $Count \n";

#the experiment 3:
my $Count = 0;
my $text = "123 abc 73xyz 34 jji";
$text =~ m{
    ^(?>
        \d+(?{$Count++})\b|\w+|\s+    
     )*
     $
}x;
print "The Third Time:The number of the (\d and \b 在字符租内部是回车符) is $Count \n";
