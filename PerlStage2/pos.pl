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

#pos() 的默认参数是$_(match)匹配  他的真正意义是 让正则引擎从什么地方开始

也许我们可以这样做
if($logline =~ m/^.{32}(\S+)/){#跳过了32个字符j
    $RequestedPage = $1;
}

但我们可以改成更加好看的
pos($logline) = 32;#请求页的信息从第32个字符开始
if ($logline =~ m/(\S+)/g){
    $RequestedPage = $1; 
}

#总结来说还是  原来字符串里面也是有着一个内部结构  微型小空间的！
#有他自己的语言进行处理！

但是这样这边没有上面的好处是！这边如果匹配失败会导致 驱动程序开始
那么就会产生很多不必要的浪费时间
如何解决呢？ 怎么产生锚定！
#修正一个错误 /g 和\G并不一样！
#/g 是让while之类的程序 接替执行   \G仅仅是一个猫定效果！ 只不过他是
#一直特定的锚专门指向上次匹配的位置 ！
#\G告诉传动装置:"不要启动传动装置的驱动过程，如果在此处匹配失败
#就报告失败！“  ^仅仅是匹配一行的字符串行首锚  $匹配行尾猫
#而pos +\G 的组合可以让正则表达式匹配任意锚！这在优化时候特别有用！
#
#！！！！！！！

所以现在可以理解 m//g如果匹配失败会重置字符串的pos到开头位置！
但如果给/g添加/c 之后会产生一种特殊的效果！：匹配失败不会重置
目标字符串的pos （\c \g相濡以沫 所以一般是/gc搭配使用

更常见的是m//gc and \G一起创建词法分析器，把字符串解析为各个符号
但是这样有一个隐藏的bug
while(m/\G\z/gc) 如果不匹配 pos位置也不会改变 而\G又从上一个位置开始
    改bug的话 就是把c给去掉 但是还是bug 因为g又无法跳转 
    所以最后想改bug的话 还是得修改\G 或者pos 或者目标字符串
不然的话这就是一个很难发现的bug
