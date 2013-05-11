#!/usr/bin/perl
# the result is comfortable with POSIX
my $RecordPossible = qr{
    (?{
       #compare the current match($&) with the match before
       if(not defined($longest_match)
           or 
           length($&) > length($longest_match))
           {
               $longest_match = $&;
               }
        })      
   (?!) #sure to be failed,and find another match with the backtrack
}x;
my $longest_match = undef; # record the leftest and the longest match
my $BailIfAnyMatch = qr{(?(?{defined $longest_match}) (?!))}; 
# if any match,namely $longest_match have values ,so it is ok! not backtrack
"800-998-9938" =~ m{$BailIfAnyMatch \d+ $RecordPossible}x;
if(defined($longest_match)){
    print "The leftest the longest match is [$longest_match].\n";
}else{
    print "no match.\n";
}

