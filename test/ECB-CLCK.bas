10 REM DISPLAY CLOCK WITH MINUTE,
11 REM HOUR, AND SECONDS HAND
20 REM JERRY STRATTON
30 REM HOBOES.COM/COCO
40 XC = 128
50 YC = 96
60 SE = 0
70 CLS
80 MO$="C"
110 PRINT "  ENTER THE HOUR AND MINUTE TO"
111 PRINT "  START THE CLOCK AT. ONCE THE"
112 PRINT " CLOCK CIRCLE FORMS, PRESS ANY"
113 PRINT "    KEY TO START THE CLOCK."
120 PRINT
130 INPUT "HOUR:MINUTE"; HO, MI:IF HO < 0 OR MI < 0 OR HO > 23 OR MI > 59 THEN 130
140 IF HO >= 12 THEN HO=HO-12
150 IF MO$ = "H" THEN PMODE 4,1:COLOR 2,1:DE = 297
160 REM COLORS ARE ORANGE(0),
161 REM WHITE(1), GREEN(2),
162 REM MAGENTA(3)
170 IF MO$ = "C" THEN PMODE 1,1:COLOR 3:DE = 303
180 REM SWITCH TO GRAPHICS SCREEN
190 PCLS
200 SCREEN 1,1
210 CIRCLE(XC,YC),YC-1
220 CIRCLE(XC,YC),YC-2
230 CIRCLE(XC,YC),YC-3
240 FT = 1
250 COLOR 2
260 A$=INKEY$:IF A$ = "" THEN 260
270 REM SECOND HAND
280 LINE(XC,YC)-(SX,SY),PRESET
290 LE = 88
300 DG = SE
310 GOSUB 1000
320 SX = X
330 SY = Y
340 LINE(XC,YC)-(SX,SY),PSET
350 REM MINUTE HAND
360 IF SE = 0 OR SE-1 = MI THEN LINE(XC,YC)-(MX,MY),PRESET:LE = 77:DG = MI:GOSUB 1000:MX = X:MY = Y:LINE(XC,YC)-(MX,MY),PSET
370 REM HOUR HAND
380 IF SE = 0 AND MI = 0 OR SE-1 = HO*5 OR FT = 1 THEN LINE(XC,YC)-(HX, HY),PRESET:LE = 55:DG = HO*5:GOSUB 1000:HX = X:HY = Y:LINE(XC,YC)-(HX,HY),PSET
390 CIRCLE(XC,YC),8
400 FOR I = 1 TO DE:NEXT I
410 SE=SE+1
420 IF SE = 60 THEN SE=0:MI=MI+1
430 IF MI = 60 THEN MI=0:HO=HO+1
440 IF HO = 12 THEN HO=0
450 FT = 0
460 GOTO 270
470 END
1000 REM ENDPOINT USING LENGTH
1001 REM AND DEGREES
1010 REM ADJUST CLOCK SECONDS TO
1011 REM RADIANS
1020 DG=DG*6
1030 DG=DG-90
1040 RA = DG/57.29577951
1050 REM CALCULATE CARTESIAN X
1051 REM AND Y FROM POLAR
1052 REM COORDINATES
1060 X = LE * COS(RA) + XC
1070 Y = LE * SIN(RA) + YC
1080 RETURN
