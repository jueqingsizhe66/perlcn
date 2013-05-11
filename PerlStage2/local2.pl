#!/usr/bin/perl
#可以参考 local3.pl

#需要注意的是 (?{}) (??{})是不能用作变量插值的！
#进行正则变量插值时一定要注意这点 可以是正则文字
use warnings;
use strict;
use re 'eval';
# the globle variable is applied!
# localize the Count ,so when the backtrate the $Count will be set again
# because the $Count is set with the previous match!if not ,The $Count will
# be set again
#the experiment 1:
our $Count = 0;
my $text = "123 abc 73x 344 5j";
# experience 123space 
$text =~ m{
    ^(?>
        \d+(?{local($Count) = $Count + 1})\b|\w+|\s+    
     )+
     $
     ({print "the final Count is $Count\n"})
}x;
print "The number of the  with localize is local($Count) \n";
#local的意思是如果匹配成功则修改全局变量值 如果失败则恢复副本前的值!

