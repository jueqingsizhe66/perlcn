#!/usr/bin/perl
my $RecordPossible = qr{
    (?{
       #compare the current match($&) with the match before
       if(not defined($longest_match)
           or 
           length($&) > length($longest_match)) #take care not leave $ alone
           #if not # the result is 800 because the match is over,not backtrake
           {
               $longest_match = $&;
               }
        })      
   (?!) #sure to be failed,and find another match with the backtrack
}x;

$longest_match = undef; #record the longest match
"800-998-9938" =~ m{\d+ $RecordPossible}x;
#so far,output the accumulated result
if(defined($longest_match)){
    print "longest match = [$longest_match]\n";
}else{
    print "no match.\n";
}
