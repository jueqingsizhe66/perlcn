:%s/(?=Jeffrey)Jeff//g
    µÈÐ§ÓÚ£º
:%s/Jeff(?=rey)//g

s/\b(Jeff)(s)\b/$1'$2/g
s/\bJeff(?=s\b)/Jeff'/g
s/(?<=\bJeff)(?=s\b)/'/g
