5 FOR P=1 TO 600:NEXT P
10 CLS: X=RND(100):Y=RND(100)
20 ? "(1) ADDITION"
30 ? "(2) SUBTRACTION"
40 ? "(3) MULTIPLICATION"
50 ? "(4) DIVISION"
60 INPUT "WHICH EXCERCISE (1-4)";R
70 CLS
80 ON R GOTO 1000, 2000, 3000, 4000
90 GOTO 5
1000 ? "WHAT IS"X"+"Y
1010 INPUT A
1020 IF A = X+Y THEN PRINT "CORRECT" ELSE PRINT "WRONG"
1030 GOTO 90
2000 ? "WHAT IS"X"-"Y
2010 INPUT A
2020 IF A = X-Y THEN PRINT "CORRECT" ELSE PRINT "WRONG"
2030 GOTO 90
3000 ? "WHAT IS"X"*"Y
3010 INPUT A
3020 IF A = X*Y THEN PRINT "CORRECT" ELSE PRINT "WRONG"
3030 GOTO 90
4000 ? "WHAT IS"X"/"Y
4010 INPUT A
4020 IF A = X/Y THEN PRINT "CORRECT" ELSE PRINT "WRONG"
4030 GOTO 90