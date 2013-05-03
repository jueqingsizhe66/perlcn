#!/usr/bin/perl 
#http://perldoc.perl.org/perlintro.html#Running-Perl-programs
use strict;
use warnings;

my $animal = "camel";
my $answer = 42;

print 3,"\t";
print $_,"\t";
#Scalar values can be strings, integers or floating point numbers, and Perl will automatically convert between them as required. There is no need to pre-declare your variable types, but you have to declare them using the my keyword the first time you use them. (This is one of the requirements of use strict; .)+

print "\n",$animal,"\n";
print "The animal is $animal\n";

my @animals = ("camel", "llama", "owl", "chicken", "howl");
my @numbers = (23, 42, 69);
my @mixed = ("camel", 42, 1.24);

print $animals[0], "\n";
print $animals[1], "\n";

print $mixed[$#mixed],"\n";

#if($animals < 5){

if(@animals < 5){
   print "animal less than 5!\n";
}

#print $animals[1,2];
#print $animals[0..2];
#print $animals[0..$#animals];

print @animals[1,2], "\n";
print @animals[0..2], "\n";
print @animals[0..$#animals], "\n";


my @sorted = sort @animals;
my @backwards = reverse @numbers;
#There are a couple of special arrays too, such as @ARGV (the command line arguments to your script) and @_ (the arguments passed to a subroutine). 

my $i = 0;
print "\n",3, "\n";
print @sorted,"\n";
for(0..$#sorted){
print $sorted[$i], "\n";
$i += 1;
}
