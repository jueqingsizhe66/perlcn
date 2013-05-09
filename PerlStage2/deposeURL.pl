#!/usr/bin/perl -w

#the program is specified with http://www.baidu.com
#是特定的文本 而第二章的是随机的文本 所以用
#[-a-z]+(\.[-a-z]+)*\.(com|edu|...|infoa)
use strict;
use warnings;

if($url =~ m{^http://[^/:]+(:(\d+))?(/.*)?}gix){
    my $host = $1; 
    my $port = $3 || 80; #if $3 undefined, then $port = 80
    my $path = $4 || "/"; 
    print "Host： $host\n";
    print "Port： $port\n";
    print "Path： $path\n";
}else{
    print "Not an valid HTTP URL\n"
}
