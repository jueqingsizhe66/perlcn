\b
# match the start part ((proto://hostname, or directly hostname
(
    # ftp://  http://  https://  the begin part
    (ftp|https?)://[-\w]+(\.\w[-\w]*)+
    # or you can use the more accurate method
    (?i: [a-z0-9](?:[-a-z0-9]*[a-z0-9])? \. )+ # check p233 in Mastering Re

    # .com etc must be lowerclass    
    (?-i: com\b
        | edu\b
        | biz\b
        | org\b
        | gov\b
        | in(?:t|fo)\b
        | mil\b
        | net\b
        | name\b
        | museum\b
        | coop\b
        | aero\b
        | [a-z][a-z]\b) # double letters country
    )
    # occur port：
    (: \d+)?

    # the leftover is likely to happen ,start with "/“
    (
        /
        # althought difficult,but actually works
        [^.!,?;"'<>()\[\]{}\S\x7F-\xFF]*
        (?:
            [.!,?]+ [^.!,?;"'<>()\[\]{}\S\x7F-\xFF]* #not IN not End with
        )*
    )?

)
