10 CLEAR 25, 4050
15 CLS
20 FOR I = 1 TO 26
30 READ B: POKE 4050+I,B
40 NEXT I
50 DATA 189,225,43,39,251,129
60 DATA 10,38,11,189,225,43,39
70 DATA 251,129,65,45,2,128,64
80 DATA 31,137,79,126,244,26
100 POKE 275,15:POKE 276,211
110 A=USR(0)
115 IF A=13 THEN END
120 ? "CODE =";A
130 GOTO 110
