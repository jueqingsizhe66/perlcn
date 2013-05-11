# /g 其实就是 \G的效果  他是记录上一次匹配的位置!  这样你才会
# 说在while循环中重复读入的都是相同的数据！  而是有记录的输入
# 这是perl的智能之处！不能说是perl而应该说是正则表达式的智能之处
#
#if进行测试

#-----得修正一个错误：perl中每个字符串都有对应的"当前匹配位置“，传动装置会从这里开始第一次匹配的尝试，这是字符串的属性 与正则表达式无关,/g的作用就是当前位置指针就会指向匹配结束位置，下一次对这个字符串的匹配就会从当前位置指针开始，也就是我们进行更新的当前位置指针  而不会从头开始  ，字符串也算是一个微型语言！
#比如说：
#pos是一个字符串的函数  计算当前字符串的位置指针！  相当于文件指针
xinran at xinran-N53SM in ~ exited 255
$ perl -w -e '$text = "15.252.192.24";while($text =~ m/(\d+)/g){
printf "Found $1,ending at the location %d\n", pos($text);}'
Found 15,ending at the location 2
Found 252,ending at the location 6
Found 192,ending at the location 10
Found 24,ending at the location 13

#精妙的设计！   连匹配起始位置 匹配中止位置 字符串当前位置指针都有了！
#pos()函数默认的参数是match元算符的默认变量 $_
xinran at xinran-N53SM in ~
$ perl -w -e '$text = "15.252.192.24";while($text =~ m/(\d+)/g){
printf "Found $1,ending at the location %d,From $-[0]--->$+[0]\n", pos($text);}' 
Found 15,ending at the location 2,From 0--->2
Found 252,ending at the location 6,From 3--->6
Found 192,ending at the location 10,From 7--->10
Found 24,ending at the location 13,From 11--->13
###
#引申：这边可以用来解释 match 和 split
#
#这边是用split函数
xinran at xinran-N53SM in ~
$ perl -w -e '$text = "Larry:Curly:Mos";print join(" ",split(":",$text));'
Larry Curly Mos
#这边是用match方法  
xinran at xinran-N53SM in ~
$ perl -w -e '$text = "Larry:Curly:Mos";print $text=~m/:/g;'
::
#总结 match是split的对立面  match拾取的是匹配点  而split拾取的是index的区间值

xinran at xinran-N53SM in ~
$ perl -w -e '$text = "Larry:Curly:Mos";print join("\n",split(":",$text));'
Larry
Curly
Mos
同时split也是list context的  而match可以是list 也可一是scale

@paragraph = split(m/\s*<p>\s*/i,$html);
@Lines = split(m/^/,$text)
从上面可以知道split的分割符既可以是我们指定的字符串也可以是正则表达式！
split(//,$text)
会把目标字符串切分成很多分~
split(/\s*/,"ffd   fsfdf fdsf")
#####match and split end-----------------------------------------####
xinran at xinran-N53SM in ~
$ perl -w -e '$text = "15.252.192.24";while($text =~ m/(\d+)/g){
printf "Found $1,ending at the location %d,From $-[0]--->$+[0]\n", pos($text);print "@+,@-\n"} '
Found 15,ending at the location 2,From 0--->2
2 2,0 0
Found 252,ending at the location 6,From 3--->6
6 6,3 3
Found 192,ending at the location 10,From 7--->10
10 10,7 7
Found 24,ending at the location 13,From 11--->13
13 13,11 11

xinran at xinran-N53SM in ~
$ perl -w -e '$text = "15.252.192.24";while($text =~ m/(\d+)/g){print "Found $1,ending at the location pos($1)";}
> '
Found 15,ending at the location pos(15)Found 252,ending at the location pos(252)Found 192,ending at the location pos(192)Found 24,ending at the location pos(24)
xinran at xinran-N53SM in ~
$ perl -w -e '$text = "15.252.192.24";while($text =~ m/(\d+)/g){
print "Found $1,ending at the location pos($text)";}
'
Found 15,ending at the location pos(15.252.192.24)Found 252,ending at the location pos(15.252.192.24)Found 192,ending at the location pos(15.252.192.24)Found 24,ending at the location pos(15.252.192.24)



#距离说明结束
xinran at xinran-N53SM in ~
$ perl -w -e '$text = "WOW! This is a SILLY game!";
if($text =~ m/\b([a-z]+\b)/g){
print "The first all-lowercase word:$1\n";}
if($text =~ m/\b([A-Z]+\b)/g){
print "The subsequent all-uppercase word:$1\n";}'
The first all-lowercase word:is
The subsequent all-uppercase word:SILLY


#while进行测试:
#恐怖的地方开始  当你没有/g的修饰符的时候 $1只会读取WOW 并且一直循环着无法终止
WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFound WOWFo
^C
xinran at xinran-N53SM in ~ exited 130
$ perl -w -e '$text = "WOW!This is a SILLY  decide";while($text =~ m/\b(\w+)\b/g){
print "Found $1";}'
Found WOWFound ThisFound isFound aFound SILLYFound decide
xinran at xinran-N53SM in ~
$ perl -w -e '$text = "WOW!This is a SILLY  decide";while($text =~ m/\b(\w+\b)/g){
print "Found $1";}'
Found WOWFound ThisFound isFound aFound SILLYFound decide

#while实验停止！！




xinran at xinran-N53SM in ~
$ perl -w -Mre=debugcolor -e '$text = "WOW! This is a SILLY game!";
> $text =~ m/\b([a-z]+\b)/g;
> print "The first all-lowercase word:$1\n";
> $text =~ m/\b([A-Z]+\b)/g;
> print "The subsequent all-uppercase word:$1\n";'
Compiling REx "\b([a-z]+\b)"
Final program:
   1: BOUND (2)
   2: OPEN1 (4)
   4:   PLUS (16)
   5:     ANYOF[a-z][] (0)
  16:   BOUND (17)
  17: CLOSE1 (19)
  19: END (0)
stclass BOUND minlen 1 
Compiling REx "\b([A-Z]+\b)"
Final program:
   1: BOUND (2)
   2: OPEN1 (4)
   4:   PLUS (16)
   5:     ANYOF[A-Z][] (0)
  16:   BOUND (17)
  17: CLOSE1 (19)
  19: END (0)
stclass BOUND minlen 1 
Matching REx "\b([a-z]+\b)" against "WOW! This is a SILLY game!"
Matching stclass BOUND against "WOW! This is a SILLY game!" (26 chars)
   0 <WOW! This >|  1:BOUND(2)
   0 <WOW! This >|  2:OPEN1(4)
   0 <WOW! This >|  4:PLUS(16)
                                  ANYOF[a-z][] can match 0 times out of 2147483647...
                                  failed...
   3 <WOW! This is >|  1:BOUND(2)
   3 <WOW! This is >|  2:OPEN1(4)
   3 <WOW! This is >|  4:PLUS(16)
                                  ANYOF[a-z][] can match 0 times out of 2147483647...
                                  failed...
   5 <WOW! This is a >|  1:BOUND(2)
   5 <WOW! This is a >|  2:OPEN1(4)
   5 <WOW! This is a >|  4:PLUS(16)
                                  ANYOF[a-z][] can match 0 times out of 2147483647...
                                  failed...
   9 < This is a SILL>|  1:BOUND(2)
   9 < This is a SILL>|  2:OPEN1(4)
   9 < This is a SILL>|  4:PLUS(16)
                                  ANYOF[a-z][] can match 0 times out of 2147483647...
                                  failed...
  10 <This is a SILLY>|  1:BOUND(2)
  10 <This is a SILLY>|  2:OPEN1(4)
  10 <This is a SILLY>|  4:PLUS(16)
                                  ANYOF[a-z][] can match 2 times out of 2147483647...
  12 <is is a SILLY g>| 16:  BOUND(17)
  12 <is is a SILLY g>| 17:  CLOSE1(19)
  12 <is is a SILLY g>| 19:  END(0)
Match successful!
The first all-lowercase word:is
Matching REx "\b([A-Z]+\b)" against " a SILLY game!"
Matching stclass BOUND against " a SILLY game!" (14 chars)
  12 <is is a SILLY g>|  1:BOUND(2)
  12 <is is a SILLY g>|  2:OPEN1(4)
  12 <is is a SILLY g>|  4:PLUS(16)
                                  ANYOF[A-Z][] can match 0 times out of 2147483647...
                                  failed...
  13 <s is a SILLY ga>|  1:BOUND(2)
  13 <s is a SILLY ga>|  2:OPEN1(4)
  13 <s is a SILLY ga>|  4:PLUS(16)
                                  ANYOF[A-Z][] can match 0 times out of 2147483647...
                                  failed...
  14 < is a SILLY gam>|  1:BOUND(2)
  14 < is a SILLY gam>|  2:OPEN1(4)
  14 < is a SILLY gam>|  4:PLUS(16)
                                  ANYOF[A-Z][] can match 0 times out of 2147483647...
                                  failed...
  15 <is a SILLY game>|  1:BOUND(2)
  15 <is a SILLY game>|  2:OPEN1(4)
  15 <is a SILLY game>|  4:PLUS(16)
                                  ANYOF[A-Z][] can match 5 times out of 2147483647...
  20 <s a SILLY game!>| 16:  BOUND(17)
  20 <s a SILLY game!>| 17:  CLOSE1(19)
  20 <s a SILLY game!>| 19:  END(0)
Match successful!
The subsequent all-uppercase word:SILLY
Freeing REx: "\b([a-z]+\b)"
Freeing REx: "\b([A-Z]+\b)"

