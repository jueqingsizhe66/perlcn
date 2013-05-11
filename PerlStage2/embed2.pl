#利用embed2代码 来说明 alternation较烂～ 字符租好
xinran at xinran-N53SM in ~
$ perl -w -e '"abcdefg" =~ m{
(?{ print "starting match at [$`|$&]\n"})
[def]
}x'
starting match at [abc|]

xinran at xinran-N53SM in ~
$ perl -w -e '"abcdefg" =~ m{
(?{ print "starting match at [$`|$&]\n"})
(d|e|f)
}x'
starting match at [|]
starting match at [a|]
starting match at [ab|]
starting match at [abc|]

xinran at xinran-N53SM in ~
$ perl -w -e '"123" =~ m{
\d+
(?{print "matched at $`|$&|\n"})
(?!)
}x;'
matched at |123|
matched at |12|
matched at |1|
matched at 1|23|
matched at 1|2|
matched at 12|3|


前三行是第一轮的匹配（驱动）
4，5两行是第二轮驱动（从2开始 所以$`为1 
6是第三轮驱动 所以$`为12
$` copy of the target in front of the match's start
$' copy of the target behind the successfully matched text
从匹配下标来看

xinran at xinran-N53SM in ~
$ perl -w -e '"123" =~ m{
\d+
(?{print "matched at $-[0]|$&|$+[0]\n"})
(?!)
}x;'
matched at 0|123|3
matched at 0|12|2
matched at 0|1|1
matched at 1|23|3
matched at 1|2|2
matched at 2|3|3


#这边也说明了这个 (?!)的用法！
以及match失败之后的结果 是使驱动进行！ 这边居然没使用到/g

xinran at xinran-N53SM in ~
$ perl -w -e '"123" =~ m{
\d+
(?{print "matched at $`|$&|\n"})
(?!)
}gx;'
matched at |123|
matched at |12|
matched at |1|
matched at 1|23|
matched at 1|2|
matched at 12|3|

#效果是一样的
