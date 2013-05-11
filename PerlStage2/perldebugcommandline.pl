root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -w -Mre=debugcolor zipcode.pl zipcode.txt >> a.txt

root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -cw -Mre=debug -e 'm/^Subject:/'
Compiling REx "^Subject:"
Final program:
   1: BOL (2)
   2: EXACT <Subject:> (5)
   5: END (0)
anchored "Subject:" at 0 (checking anchored) anchored(BOL) minlen 8 
-e syntax OK
Freeing REx: "^Subject:"

root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -cw -Mre=debug -e 'm/^Subject:(.*)/'
Compiling REx "^Subject:(.*)"
Final program:
   1: BOL (2)
   2: EXACT <Subject:> (5)
   5: OPEN1 (7)
   7:   STAR (9)
   8:     REG_ANY (0)
   9: CLOSE1 (11)
  11: END (0)
anchored "Subject:" at 0 (checking anchored) anchored(BOL) minlen 8 
-e syntax OK
Freeing REx: "^Subject:(.*)"

root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -cw -Mre=debug -e 'm/\G^Subject:(.*)/'
Compiling REx "\G^Subject:(.*)"
Final program:
   1: GPOS (2)
   2: BOL (3)
   3: EXACT <Subject:> (6)
   6: OPEN1 (8)
   8:   STAR (10)
   9:     REG_ANY (0)
  10: CLOSE1 (12)
  12: END (0)
anchored "Subject:" at 0 (checking anchored noscan) anchored(BOL)(GPOS) GPOS:0 minlen 8 
-e syntax OK
Freeing REx: "\G^Subject:(.*)"

#
#
#去掉-c可以获得更多的perl正则表达式信息
root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -w -Mre=debug -e 'm/\G^Subject:(.*)/'
Compiling REx "\G^Subject:(.*)"
Final program:
   1: GPOS (2)
   2: BOL (3)
   3: EXACT <Subject:> (6)
   6: OPEN1 (8)
   8:   STAR (10)
   9:     REG_ANY (0)
  10: CLOSE1 (12)
  12: END (0)
anchored "Subject:" at 0 (checking anchored noscan) anchored(BOL)(GPOS) GPOS:0 minlen 8 
Use of uninitialized value $_ in pattern match (m//) at -e line 1.
Freeing REx: "\G^Subject:(.*)"

$ perl -w -Mre=debug -e '"this is a bug"=~m/^Subject:(.*)/igx'
Compiling REx "^Subject:(.*)"
Final program:
   1: BOL (2)
   2: EXACTF <Subject:> (5)
   5: OPEN1 (7)
   7:   STAR (9)
   8:     REG_ANY (0)
   9: CLOSE1 (11)
  11: END (0)
stclass EXACTF <Subject:> anchored(BOL) minlen 8 
Matching REx "^Subject:(.*)" against "this is a bug"
   0 <> <this is a >         |  1:BOL(2)
   0 <> <this is a >         |  2:EXACTF <Subject:>(5)
                                  failed...
Match failed
Freeing REx: "^Subject:(.*)"

#加入 use warnings 也许会看到更多的调试信息  因为warnings这个模块包含着很多正则表达式信息
root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -w -Mre=debug -e 'use warnings;"this is a bug"=~m/^Subject:(.*)/igx;'
Compiling REx "^Subject:(.*)"
Final program:
   1: BOL (2)
   2: EXACTF <Subject:> (5)
   5: OPEN1 (7)
   7:   STAR (9)
   8:     REG_ANY (0)
   9: CLOSE1 (11)
  11: END (0)
stclass EXACTF <Subject:> anchored(BOL) minlen 8 
Matching REx "^Subject:(.*)" against "this is a bug"
   0 <> <this is a >         |  1:BOL(2)
   0 <> <this is a >         |  2:EXACTF <Subject:>(5)
                                  failed...
Match failed
Freeing REx: "^Subject:(.*)"


use re 'debug';  等效与  -Mre=debug的命令行效果
一个通用式子 perl -w -Mre=debug -e 'use warnings;正则表达式;' 


#把debug 换成debugcolor会高亮显示那些提示信息(当然要求支持ANSI转义控制符)o
#
#ANSI teminal control escape sequence
root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -w -Mre=debugcolor -e 'use warnings;"this is a bug"=~m/^Subject:(.*)/igx;'
Compiling REx "^Subject:(.*)"
Final program:
   1: BOL (2)
   2: EXACTF <Subject:> (5)
   5: OPEN1 (7)
   7:   STAR (9)
   8:     REG_ANY (0)
   9: CLOSE1 (11)
  11: END (0)
stclass EXACTF <Subject:> anchored(BOL) minlen 8 
Matching REx "^Subject:(.*)" against "this is a bug"
   0 <this is a >|  1:BOL(2)
   0 <this is a >|  2:EXACTF <Subject:>(5)
                                  failed...
Match failed
Freeing REx: "^Subject:(.*)"

