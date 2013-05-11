#!/usr/bin/perl 
use warnings;
use strict;
use charnames ':full';
use Config;
print "$Config{privlib}/unicore/UnicoreData.txt\n";
#print "$Config{privlib}/zipcode.txt\n";



#执行结果：
#$ perl  full.pl 
#/usr/share/perl/5.12/unicore/UnicoreData.txt

