10 ' WANDERING.BAS
20 CLS0
30 G1=1024:G2=1055:G3=1504:G4=1535
40 C1=191:C2=239:C3=223:C4=255
50 ' DISPLAY GHOSTS
60 POKE G1,C1:POKE G2,C2:POKE G3,C3:POKE G4,C4
70 ' RANDOM MOVE G1
80 ON RND(4) GOTO 90,100,110,120
90 NL=G1+1:GOTO 130
100 NL=G1-1:GOTO 130
110 NL=G1-32:GOTO 130
120 NL=G1+32
130 IF NL<1024 THEN 180
140 IF NL>1535 THEN 180
150 ' ERASE G1 AND UPDATE LOCATION
160 POKE G1,128:POKE NL,C1:G1=NL
170 ' RANDOM MOVE G2
180 ON RND(4) GOTO 190,200,210,220
190 NL=G2+1:GOTO 230
200 NL=G2-1:GOTO 230
210 NL=G2-32:GOTO 230
220 NL=G2+32
230 IF NL<1024 THEN 280
240 IF NL>1535 THEN 280
250 ' ERASE G2 AND UPDATE LOCATION
260 POKE G2,128:POKE NL,C2:G2=NL
270 ' RANDOM MOVE G3
280 ON RND(4) GOTO 290,300,310,320
290 NL=G3+1:GOTO 330
300 NL=G3-1:GOTO 330
310 NL=G3-32:GOTO 330
320 NL=G3+32
330 IF NL<1024 THEN 380
340 IF NL>1535 THEN 380
350 ' ERASE G4 AND UPDATE LOCATION
360 POKE G3,128:POKE NL,C3:G3=NL
370 ' RANDOM MOVE G4
380 ON RND(4) GOTO 390,400,410,420
390 NL=G4+1:GOTO 430
400 NL=G4-1:GOTO 430
410 NL=G4-32:GOTO 430
420 NL=G4+32
430 IF NL<1024 THEN 470
440 IF NL>1535 THEN 470
450 ' ERASE G4 AND UPDATE LOCATION
460 POKE G4,128:POKE NL,C4:G4=NL
470 GOTO 60