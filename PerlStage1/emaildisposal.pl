#!/usr/bin/perl
use strict;
use warnings;

my $line;
my $subject;
my $date;
my $reply_addr;
my $from_name;

while($line = <>){ # it must be <> not < >
    if($line =~ m/^\s*$/){
    last; 
    }
    if($line =~ m/^Subject: (.*)/i){
    $subject = $1; 
    print $1;
    }
    if($line =~ m/^Date: (.*)/i){
    $date = $1; 
    }
    if($line =~ m/^Reply-To: (\S+)/i){#\S not \s
    $reply_addr = $1;
    }
    if($line =~ m/^From: (\S+)\(([^()]*)\)/i){ #\S not \s
    $reply_addr = $1; 
    $from_name = $2;
    }
}
if(not defined($reply_addr) or not defined($from_name)
        or not defined($subject)
        or not defined($date)){
            die "Couldn't glean the required information!";
}
print "To: $reply_addr ($from_name)\n";
print "From: jfriedl\@regex.info (Jfriedl Friedl)\n";
print "Subject: Re: $subject \n";
print "\n" ;  #blank line to seperate the header from body

print "On $date $from_name wrote:\n";

while($line = <>){ # continue read the file ,because it have last stop!
                    # so it is funny here ,use a blankline to jump out of 
                    # the while cycle!!!!
                    #so you can read the file pointer again ,so get the 
                    #body of the email
                    # so the constructor of the file is very important!!
    print "|> $line";
    # $line =~ s/^/|>/;
    # print line;
}
