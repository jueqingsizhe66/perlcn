#!/usr/bin/perl
use encoding 'utf-8' , STDIN => 'utf-8', STDOUT => 'utf-8';
#use encoding 'utf-8';
#！---coding =utf-8 -*--
use strict;
use warnings;

my %studentage;

%studentage = (
    #"张三"=>19,
    #"李四"=>22
    "张三" =>{"物理" => 85, "化学" =>83, "生物" => 90},
    "李四" => {"物理" => 80, "化学" =>73, "生物" => 93},
    "王五" => {"物理" => 95, "化学" =>73, "生物" => 80}
);


# 访问hash
print "王五的生物成绩为$studentage{'王五'}{'生物'}";
#print "张三:$studentage{'张三'}";
print "\n";

