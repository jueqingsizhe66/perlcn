#!/usr/bin/perl 
use strict;
use warnings;

# $&的意思是上次匹配的值  从这便可以看出其实在match的小世界
# 中 存在着n多的while循环 只不过是我们看不到只有正则表达式引擎自己
# 知道！！
#强制失败的语法在这边的运用！！ (?!) 这有点类似 while(m/\G\z/gcx) 当到 句尾
#的时候则循环结束  其实在任何的一个string的内部都包含着while if break continue  or goto  jump  等指令 里面也是有着一套subroutine！ 
my $longest_match = undef; # record the longest match

"oneselfsufficient" =~ m{
    one(self)?(selfsufficient)?
    (?{
    #compare the current match($&) with the longest match before
    if(not defined($longest_match) 
        or
        length($&) > length($longest_match)){
            $longest_match = $&; 
        }
    })
    (?!) #Certain for failure,search other match through backtrate

}x;
if(defined($longest_match)){
    print "longest_match = [$longest_match];"
}else{
    print "no match\n";
}
