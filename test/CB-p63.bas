10 PRINT "CHOOSE YOUR CHAMBER (1-10)"
20 INPUT X
30 IF X=RND(10) THEN 100
40 SOUND 200,1
50 PRINT "--CLICK--"
60 GOTO 10
100 PRINT "BANG -- YOUR'RE DEAD"
