<B>       #match 开头的<B>
    (?> [^<]*)  #normal = [^<]  special = (?! </?B>)<
    (?>
        (?! </?B>) #if not <B> or </B> 
        <
        [^<]*
    )*
</B>


#original edition
<B>
(
    (?!</?B>)
    .
)*
</B>
