xinran at xinran-N53SM in ~
$ perl -w -e '$RecordPossibleMatch = qr{
> (?{
> # compare $&(now record) with the before record
> if(not defined($longest_match)) or length($&) > length($longest_match)){
> $longest_match=$&}})
> (?!) #sure failure
> }x; $longest_match =undef;
> "800-990=8-9938" =~ m{\d+$RecordPossibleMatch}x;
> if(defined($longest_match)){
> print "longest match ={$longest_match)\n";}
> else{
> print "no match\n"}
> '
syntax error at (re_eval 1) line 3, near ") or"
Compilation failed in regexp at -e line 7.

