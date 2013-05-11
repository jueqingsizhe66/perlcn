my $Date = '1990/1/9';
scaleReturn:


my $success = $Date =~ m/(\d)\/(\d)\/(\d)/;

$success =True or false

ListReturn:

my ($year,$month,$day) = $Date =~ m/(\d)\/(\d)\/(\d)/;

my @array = $Date =~ m/(\d)\/(\d)\/(\d)/;

my ($success) =$Date =~ m/(\d)\/(\d)\/(\d)/;

这边就是返回一个数组  而不是仅仅boolean值
root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl  -w -Mre=debugcolor -e '$date="1990-1-9"; ($year,$month,$day)= $date=~
m{(\d+)-(\d+)-(\d+)}x; print "year = $year,month=$month, day = $day.\n";'
Compiling REx "(\d+)-(\d+)-(\d+)"
Final program:
   1: OPEN1 (3)
   3:   PLUS (5)
   4:     DIGIT (0)
   5: CLOSE1 (7)
   7: EXACT <-> (9)
   9: OPEN2 (11)
  11:   PLUS (13)
  12:     DIGIT (0)
  13: CLOSE2 (15)
  15: EXACT <-> (17)
  17: OPEN3 (19)
  19:   PLUS (21)
  20:     DIGIT (0)
  21: CLOSE3 (23)
  23: END (0)
floating "-" at 1..2147483647 (checking floating) stclass DIGIT plus minlen 5 
Guessing start of match in sv for REx "(\d+)-(\d+)-(\d+)" against "1990-1-9"
Found floating substr "-" at offset 4...
start_shift: 1 check_at: 4 s: 0 endpos: 4
Does not contradict STCLASS...
Guessed: match at offset 0
Matching REx "(\d+)-(\d+)-(\d+)" against "1990-1-9"
Matching stclass DIGIT against "1990" (4 chars)
   0 <1990-1-9>|  1:OPEN1(3)
   0 <1990-1-9>|  3:PLUS(5)
                                  DIGIT can match 4 times out of 2147483647...
   4 <1990-1-9>|  5:  CLOSE1(7)
   4 <1990-1-9>|  7:  EXACT <->(9)
   5 <1990-1-9>|  9:  OPEN2(11)
   5 <1990-1-9>| 11:  PLUS(13)
                                    DIGIT can match 1 times out of 2147483647...
   6 <1990-1-9>| 13:    CLOSE2(15)
   6 <1990-1-9>| 15:    EXACT <->(17)
   7 <1990-1-9>| 17:    OPEN3(19)
   7 <1990-1-9>| 19:    PLUS(21)
                                      DIGIT can match 1 times out of 2147483647...
   8 <1990-1-9>| 21:      CLOSE3(23)
   8 <1990-1-9>| 23:      END(0)
Match successful!
year = 1990,month=1, day = 9.
Freeing REx: "(\d+)-(\d+)-(\d+)"

# delimiter为/   注意看清楚！
root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl  -w -Mre=debugcolor -e '$date="1990/1/9"; ($year,$month,$day)= $date=~
m{(\d+)/(\d+)/(\d+)}x; print "year = $year,month=$month, day = $day.\n";'
Compiling REx "(\d+)/(\d+)/(\d+)"
Final program:
   1: OPEN1 (3)
   3:   PLUS (5)
   4:     DIGIT (0)
   5: CLOSE1 (7)
   7: EXACT </> (9)
   9: OPEN2 (11)
  11:   PLUS (13)
  12:     DIGIT (0)
  13: CLOSE2 (15)
  15: EXACT </> (17)
  17: OPEN3 (19)
  19:   PLUS (21)
  20:     DIGIT (0)
  21: CLOSE3 (23)
  23: END (0)
floating "/" at 1..2147483647 (checking floating) stclass DIGIT plus minlen 5 
Guessing start of match in sv for REx "(\d+)/(\d+)/(\d+)" against "1990/1/9"
Found floating substr "/" at offset 4...
start_shift: 1 check_at: 4 s: 0 endpos: 4
Does not contradict STCLASS...
Guessed: match at offset 0
Matching REx "(\d+)/(\d+)/(\d+)" against "1990/1/9"
Matching stclass DIGIT against "1990" (4 chars)
   0 <1990/1/9>|  1:OPEN1(3)
   0 <1990/1/9>|  3:PLUS(5)
                                  DIGIT can match 4 times out of 2147483647...
   4 <1990/1/9>|  5:  CLOSE1(7)
   4 <1990/1/9>|  7:  EXACT </>(9)
   5 <1990/1/9>|  9:  OPEN2(11)
   5 <1990/1/9>| 11:  PLUS(13)
                                    DIGIT can match 1 times out of 2147483647...
   6 <1990/1/9>| 13:    CLOSE2(15)
   6 <1990/1/9>| 15:    EXACT </>(17)
   7 <1990/1/9>| 17:    OPEN3(19)
   7 <1990/1/9>| 19:    PLUS(21)
                                      DIGIT can match 1 times out of 2147483647...
   8 <1990/1/9>| 21:      CLOSE3(23)
   8 <1990/1/9>| 23:      END(0)
Match successful!
year = 1990,month=1, day = 9.
Freeing REx: "(\d+)/(\d+)/(\d+)"


#用了一个@array来存储匹配的值
root at xinran-N53SM in /home/PerlHome/PerlStage2 exited 2 on git:develop+?
$ perl -ne '$date="1990/1/9"; @array = $date=~
m{(\d+)/(\d+)/(\d+)}x; print "@array.\n";'

1990 1 9.


#用了一个scale变量来存储最后的结果！  所以凡是具有list 概念的变量都是可以存储匹配值得！
root at xinran-N53SM in /home/PerlHome/PerlStage2 on git:develop+?
$ perl -ne '$date="1990/1/9"; ($success) = $date=~
m{(\d+)/(\d+)/(\d+)}x; print "$success.\n";'

1990.


#仅仅是存储这 1 或者0  因为没有() 返回一个组的信息！
root at xinran-N53SM in /home/PerlHome/PerlStage2 exited 130 on git:develop+?
$ perl -ne '$date="1990/2/9"; ($success) = $date=~
m{\d+/\d+/\d+}x; print "$success.\n";'

1.


