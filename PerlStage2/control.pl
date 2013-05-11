# 经典的 $&字符！
正则表达式的运用场合是指：list scale  void
这三中+一般还需要考虑目标字符串的pos 以及修饰符
xinran at xinran-N53SM in ~
$ perl -w -e '$text = "Larry Curly Mos"; while($text=~m/\w+/g){
print "\nWhile Storage si $&.\n";}'

While Storage si Larry.

While Storage si Curly.

While Storage si Mos.

xinran at xinran-N53SM in ~
$ perl -w -e '$text = "Larry Curly Mos"; if($text=~m/\w+/g){
print "\nWhile Storage si $&.\n";}'

While Storage si Larry.

xinran at xinran-N53SM in ~
$ perl -w -e '$text = "Larry Curly Mos"; foreach($text=~m/\w+/g){
print "\nWhile Storage si $&.\n";}'

While Storage si Mos.

While Storage si Mos.

While Storage si Mos.
