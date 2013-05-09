(?i: [a-z0-9](?:[-a-z0-9]*[a-z0-9])? \. )+ # check p233 in Mastering Re

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

