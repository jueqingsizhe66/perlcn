#!/usr/bin/perl
use warnings;
use strict;

my $HostnameRegex = qr/[-a-z0-9]+(?:\.[-a-z0-9]+)*\.(?:com|edu|info)/i;

my $HttpUrl = qr{
    http:// $HostnameRegex \b #hostname
    (?:
        /[-a-z0-9,?.!_:\@=+/~*'"%\$]* #optional path  
        (?<![.,?!])#not allowed to end with [.,!?]
    )
}ix;

#运用1 ：检测URL
if($text =~ $HttpUrl){   #使用正则算子 没有qr 和有qr是不同的表现方法 虽然结果一样
    print "There is a URL there /n";
}

#运用2：检查出所有的URLs
while($text =~ m/($HttpUrl)/g){ #使用变量插值！！
    print "Found URL: $1\n";
}

#为了更加符合url规范  修改$hostnameregex


my $HostnameRegex = qr/
    #一个或多个点号分隔部分
    (?:[-a-z0-9]+(?:\.[-a-z0-9]+)*\.) #一般限制是63个字符之类的
    #后缀 
    (?:com|edu|in(?:t|fo)|org|gov|net|mil|biz|aero|[a-z][a-z]
    /xi;
