5 REM GETTING STARTED WITH COLOR BASIC
6 REM READY AIM FIRE, P145
10 CLS : PRINT
20 PRINT "HIT 'Z' KEY TO AIM LEFT"
30 PRINT "HIT '/' KEY TO AIM RIGHT"
40 PRINT "HIT SPACE BAR TO FIRE"
50 FOR K = 1 TO 3000 : NEXT K
60 CLS(0)
70 CA = 464
80 PRINT @ CA, "*";
90 PRINT @ 495, "***";
100 PRINT @ 32, " "
110 F = 0
120 PRINT @ 32 + I * 4, "    ";
130 IF I > 6 THEN I = 0
140 I = I + RND(10)/10
150 PRINT @ 32 + I * 4, "--->";
160 IF F = 0 THEN 500
170 RESET(MX,MY)
180 MX = MX - MD
190 MY = MY - 8
200 IF MX < 1 THEN 110
210 IF MX > 63 THEN 110
220 IF MY > 2 THEN SET(MX,MY,5) : GOTO 120
230 IF ABS(I*8-MX) > 4 THEN 110
240 FOR J = 1 TO 6
250 PRINT @ 32+4*I, "****";
260 FOR K = 1 TO 50
270 NEXT K
272 PRINT @ 32 + I * 4, "    "
274 FOR K = 1 TO 50
276 NEXT K
280 NEXT J
290 FOR K = 200 TO 10 STEP -3
300 SOUND K, 1
310 NEXT K
320 FOR K = 1 TO 7 : CLS(K)
330 FOR KK = 1 TO 50 : NEXT KK
340 NEXT K
350 CLS(0)
360 GOTO 60
500 Y$ = INKEY$
510 IF F = 1 THEN END
520 IF Y$ <> "Z" THEN 550
530 IF CA < 462 THEN 120
540 PRINT @ CA, CHR$(160);
545 CA = CA - 1
547 GOTO 580
550 IF Y$ <> "/" THEN 590
560 IF CA > 466 THEN 120
570 PRINT @ CA, CHR$(160);
575 CA = CA + 1
580 PRINT @ CA, "*"; : GOTO 120
590 IF Y$ <> " " THEN 120
600 F = 1 : MD = 464 - CA : MY = 20
610 MX = 32 - 3 * MD : SET(MX,MY,3) : GOTO 120
620 END
