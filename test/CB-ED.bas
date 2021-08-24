1 REM GETTING STARTED WITH COLOR BASIC
2 REM ELECTRONIC DICE, P291
4 CLEAR 2000
5 CLS(3)
6 DIM DB$(6)
8 DIM DF(21), P(6), D$(6)
10 REM FACE OF DIE
20 FOR X = 1 TO 21
30 READ DF(X)
40 NEXT X
50 DATA 39
60 DATA 14, 64
70 DATA 14, 39, 64
80 DATA 14, 20, 58, 64
90 DATA 14, 20, 39, 58, 64
100 DATA 14, 20, 36, 42, 58, 64
105 FOR X = 1 TO 7
110 REM
120 REM PLACE IN ARRAY DF
130 FOR X = 1 TO 6
140 READ P(X)
150 NEXT X
160 DATA 1, 2, 4, 7, 11, 16
165 REM
170 REM BUILD DIE STRING
175 FOR X = 1 TO 6
180 M = P(X)
185 FOR Y = 1 TO 7
190 FOR Z = 1 TO 11
192 IF (Y-1)*11+Z <> DF(M) THEN 200
194 D$(X) = D$(X) + CHR$(128)
196 M = M + 1
197 IF M = 22 THEN M = 0
198 IF M = X THEN M = 0
199 GOTO 230
200 D$(X) = D$(X) + CHR$(143+96)
230 NEXT Z
240 FOR Z = 0 TO 31-11
250 D$(X) = D$(X) + CHR$(143+32)
260 NEXT Z
270 NEXT Y,X
480 REM
490 REM ROLL DICE
500 FOR T= 1 TO 10
510 A=RND(6): B = RND(6)
520 PRINT @ 35, D$(A);
530 PRINT @ 273, D$(B);
540 NEXT T
550 PRINT @ 113, "PRESS ANY KEY";
560 PRINT @ 145, "FOR NEXT ROLL";
570 K$=INKEY$:IF K$="" THEN 570
580 GOTO 500
