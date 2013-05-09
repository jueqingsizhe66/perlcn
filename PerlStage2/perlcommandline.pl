#能够进行命令行最关键的就是   perl的-ne开关
#python 由于具有严格的缩进控制  且没有；进行分离每一句
#基本上命令行是比较少用的！
+---------------perl字符串处理------------------------+ 
| Perl字符串处理 2011-12-15 10:10:07

分类： Python/Ruby

众所周知Perl处理字符串的功能非常强大，Perl(Practical Extraction and Reporting language)处理格式的功能也非常强大，这里我们就开始学习一些Perl的格式和字符串处理。

熟悉其最强大的三个函数：substr、pack、unpack。

命令行实验室的方法：
        file or echo "Heelo" |perl -ne 'perl 语句;' 即可
1、大小写处理函数 lc(转为小写) uc(转为大写) 。
$text="zhengwen feng";
$text2=lc $text;
$text3=uc $text;
print "$text2\n";
print "$text3\n";

##-------commandline------###
[root@localhost ~]# echo -n 'hello, hanli' | perl -ne '$rev=uc($_); print $rev,"\n";' 
HELLO, HANLI 
[root@localhost ~]# echo -n 'HELLO, hanli' | perl -ne '$rev=lc($_); print $rev,"\n";' 
hello, hanli 
[root@localhost ~]# echo -n 'hello, Hanli' | perl -ne '$rev=ucfirst($_); print $rev,"\n";' 
Hello, Hanli 
[root@localhost ~]# echo -n 'hello, Hanli' | perl -ne '$rev=lcfirst($_); print $rev,"\n";' 
hello, Hanli 
##-------commandline------###
  
2、将第一字母变为小写(lcfirst)，将第一个字母大写(ucfirst)。
$string="zheng";
$string2=lcfirst $string;
$string3=ucfirst $string;
print "$string2\n";
print "$string3\n";

3、顺序查找string位置(index)，逆序查找string位置(rindex)。index在字串中找尋某一子字串的起始位置。
$string="zheng wen feng zheng wen feng";
$position1=index($string,"wen");
$position2=index($string,"wen",10);
$position3=rindex($string,"zheng");
$position4=rindex($string,"zheng",10);
print "$position1,$position2,$position3,$position4\n";

###---commandlineiiiiii###
[root@localhost ~]# echo -n '/var/fap/test/123' | perl -ne '$rev=index($_, "a"); print $rev,"\n";' 
2 
[root@localhost ~]# echo -n '/var/fap/test/123' | perl -ne '$rev=index($_, "a", 1); print $rev,"\n";' 
2 
[root@localhost ~]# echo -n '/var/fap/test/123' | perl -ne '$rev=index($_, "a", 3); print $rev,"\n";' 
6 
[root@localhost ~]# echo -n '/var/fap/test/123' | perl -ne '$rev=index($_, "a", 7); print $rev,"\n";' 
-1


##---commandline----###
#rindex
[root@localhost ~]# echo -n '/var/ftp/tesa/123' | perl -ne '$rev=rindex($_, "a", 11); print $rev,"\n";' 
2 
[root@localhost ~]# echo -n '/var/ftp/tesa/123' | perl -ne '$rev=rindex($_, "a", 12); print $rev,"\n";' 
12 
[root@localhost ~]# echo -n '/var/ftp/tesa/123' | perl -ne '$rev=rindex($_, "a", 1); print $rev,"\n";' 
-1 
[root@localhost ~]# echo -n '/var/ftp/tesa/123' | perl -ne '$rev=rindex($_, "a", 2); print $rev,"\n";' 
2


#!/usr/bin/Perl
$str="ABCDEFG1234567";
$a="12";
$pos=index($str,$a);
print $pos,"\n";

[hto@localhost]$./tipind.pl
7

4、获取子串函数substr，功能非常强大，可以直接支持以一个字符串代替字符串的一个子串。
$text="zhaoliang  喜欢 xinran";
$replace_to="喜欢";
$replace_with="爱";
substr($text,index($text,$replace_to),length($replace_to),$replace_with);
print "$text\n";


##--------commandline---------##
[root@localhost ~]# echo -n '/var/ftp/test/123' | perl -ne '$rev=substr($_, 9,);print $rev,"\n";' 
test/123 
[root@localhost ~]# echo -n '/var/ftp/test/123' | perl -ne '$rev=substr($_, 9, 4);print $rev,"\n";' 
test 
 

替换：
[root@localhost ~]# 
echo -n '/var/ftp/test/123' |perl -ne '$rev=substr($_,9, 4)="hello";print $rev,"\n";' 
#这条实验没啥意义
hello
echo -n '/var/ftp/tesa/123'|perl -ne '$rev=substr($_,9,4)="hello";print $_'
/var/ftp/hello/123


删除：
 

[root@localhost ~]# echo -n '/var/ftp/test/123' | perl -ne '$rev=substr($_, 9, 4)=""; print $rev,"\n";' 

##--------commandline---------##

5、字符串中取串长(字符数量)-length
#!/usr/bin/Perl
$str="abCD99e";
$strlen=length($str);
print $strlen,"\n";
[htog@localhost]$./tiplen.pl
7

#--------commandline------###
root@localhost ~]# echo -n '/var/ftp/tesa/123' | perl -ne '$rev=length($_); print $rev,"\n";' 
17 
[root@localhost ~]# echo -n '/var/ftp/tesa/123 ' | perl -ne '$rev=length($_); print $rev,"\n";' 
19

#--------commandline------###

8、pack和unpack函数用于字符串的打包和解包，功能非常强大，支持多种打包格式字符串处理的。
$decimal=17;
$newdecimal=unpack("B32",pack("N",$decimal));
print "$newdecimal\n";
$string="张大华爱中国";
@array1=unpack("c*",$string);
@array2=unpack("C*",$string);
print (join(",",@array1),"\n");
print (join(",",@array2),"\n");
$string1=pack("c*",@array1);
$string2=pack("C*",@array2);
print "$string1\n";
print "$string2\n";

9、打印格式-sprintf
$value=1234.56789;
print sprintf "%.4f\n",$value;

10、字符串比较函数 eq、ne、cmp、lt、gt、le、ge，使用cmp就好。绝不能用'==',要用eq，正确的做法是：不论整形Perl字符串，都用eq。
$string1="大华";
$string2="大华";
if($string1 eq $string2){
print "$sting1==$string2\n";
}
if($string1 ne $string2){
print "$string1!=$string2\n";
}

if( ($string1 cmp $string2)==0){
print "$string1==$string2\n";
}

$string1="zheng";
$string2="Kitty";
if($string1 lt $string2){
print "left < right \n";
}

if($string1 gt $string2){
print "left > right \n";
}

if($string1 le $string2){
print "left < right \n";
}

if($string1 ge $string2){
print "left > right \n";
}

11、字符分割操作-split
@数组=split(pattern,串)，将Perl字符串用某模式分成多个单词。
#!/usr/bin/Perl
$str="ABCDEiFG12i34567";
@array=split(//,$str);按空格分
foreach(@array){
print$_,"\n";
}

[hto@localhost]$./tip.pl
ABCDEi
FG12i
345
6
7

@array=split(/+/,$line);当一行中各单词间的空格多于一个时。

空格和TAB混杂情况下的split
[hto@localhost]$vitip.pl

#!/usr/bin/Perl
$str="ABCDEiFG12i34567";
@array=split(/\t/,$str); #以\t进行分割
foreach(@array){
print$_,"\n";
}

[hto@localhost]$./tip.pl
ABCDEiFG12i
34567

只分了两份，为什么？因为同时满足TAB和空格的只有一处，所以必须加[]。
@array=split(/[\t]/,$str);现在才是真正的按空格和TAB分
#这边的[]字符组序列的运用需要注意
[hto@localhost]$./tip.pl
ABCDEi
FG12i

345
6
7

但还是有缺陷，TAB和空格相连时，TAB被认为是空格划分的子串，或者空格被认为是TAB划分的子串。

$string="张大华爱中国";
@array=split(//,$string);#这种方法无法将其进行分成"张","大","华","爱","中","国"等单字
print (join(",",@array),"\n");
#from mine  below
$ perl -ne '$string = "fdfdff3";@array=split(//,$string); print (join("#",@array),"\n");'

f#d#f#d#f#f#3
使用join函数可以拼接各个字符串，签名为join(delmiter, list)。其中delimiter是一个分隔字符串，在拼接结果中各个分离字符串以该delimiter分隔；list则是各个分离的字符串，也可以是一个保存着若干字符串的数组。
　　$str1 = "stringA" ;  $str2 = "stringB";
　　$combine = join '::' , $str1 , $str2 ;  #$combine值为::stringA::stringB
　　@list1 = ( $str1 , $str2 );  @list2 = qw ( stringC  stringD );
　　$combine = join '_' , @list1 , @list2 , $str1 ;  #$combine值为_stringA_stringB_stringC_stringD_stringA

　　分隔符使用"\n"时，就可以拼接成垂直列表了。

12、演示中文字符夹带英文字符的反序(使用了多个函数)
print "------begin-----\n";
$string1="中国love!张大华";
@array=unpack("C*",$string1);
$length=$#array;#此数组的最后一个下标
for(;$length>=0;){
if($array[$length]<=128){
#英文或者标点
push(@array2,$array[$length]);
$length=$length-1;
}
else{
#中文字符
push(@array2,$array[$length-1]);
push(@array2,$array[$length]);
$length=$length-2;
}
}

$string2=pack("C*",@array2);
print "$string2\n";
$dir=dir;
print qx/$dir/;
@name=qw/zheng wen feng Kitty Kitty/;
print join(",",@name);

13、字符合并操作-join
用join定义Perl字符串数组格式符号(缺省)必须与qw()合用。
语法：join($string,@array)
@array=qw(onetwothree);
$total="one，two，three";
@array=qw(onetwothree);
$total=join("：",@array);
$total="one：two：three";

14、匹配数组内元素字串-grep
@array=("one","on","in");
$count=grep(/on/,@array);
查询结果赋值给单变量
@array=("one","on","in");
@result=grep(/on/,@array);
查询结果赋值给数组
2
one
on

15、字符串连接-'.='
关于perl字符串连接的方法讨论。
$line = $line."456";
这个语句中，line要被计算两次。
$line .= "456" ;
运算符','，常用于输出：
print "金",$v1;
print $str,"\n\n";

'.'运算符和','类似，也是Perl字符串相加但通常只用于print而'.'可以用在任何Perl字符串相加的地方。
print '12345大家來'."helloworld";
結果变成：12345大家來helloworld

16、重复连接运算符号-x
print"OK"x4;
結果变成：
OKOKOKOK
这个计算一次就可以了。Perl字符串的连接可以连接整形和字符形，整形也被当作字符型处理，没有printf里的%d问题。

17、双引号字符串中的转义符
符号    含义
\n    换行
\r    回车
\t    制表符
\f    formfeed
\b    退格
\a    响铃
\e    escape(ASCII中的escape字符)
\007    任何八进制值(这里是，007=bell(响铃))
\x7f    任何十进制值(这里是，007=bell)
\cC    一个控制符(这里是，ctrl+c)
\\    反斜线
\"    双引号
\l    下个字符小写
\L    接着的字符均为小写直到\E
\u    下个字符大写
\U    接着的字符均为大写直到\E
\Q    在non-word字符前加上\，直到\E
\E    结束\L,\E和\Q
   
###总结：
#字符串的处理主要就是 index  length  split  substr  join  x   sprintf printf  lc uc lcfirst ucfirst
