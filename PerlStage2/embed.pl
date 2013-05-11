root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -w -e '"have a nice day" =~ m{
> (?{print "starting match .\n"})
> \b(?:the|an|a)\b
> }x'
starting match .
starting match .
starting match .
starting match .
starting match .
starting match .
#说明传动装置在运行之前已经驱动了6次！！！最后一次完成了
#匹配驱动停止  小车不孕行了！o

^(\d+)(??{"X{$1}"})$  这是相当精彩的
3xxx  7xxxxxxx  才可以匹配
这叫做perl独有的动态正则匹配！
