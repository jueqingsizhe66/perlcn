# output the link in $html
#
#!/usr/bin/perl -w
use strict;
use warnings;

while(my $Html = <>){
    if($Html =~ m{a\b([^>]+)>(.*?)</a>}ig){
        my $Gut = $1;# put the link into Gut
        my $LinkText = $2;
        if ($Gut =~ m{
           \b HREF  #href property 
           \s* = \s*  # "=" at either ends hava space
           (?:
            "([^"]*)" # can contain the ">"
            |
            '([^']*)' # can contain the '>'
            |
            ([^'">\s]+) #"+其他文本
            
           )
            }gix)
            {
                my $url = $+; #get the $1,$2,...$max, $+ = $max 
                print "$url with the link text: $LinkText\n";
            }        
    }
}
