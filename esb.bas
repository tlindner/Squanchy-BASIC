10 PCLEAR 1:CLEAR 50, 8192
15 PRINT "START EXTENDED SQUANCHY BASIC"
20 IF PEEK(58108)=77 THEN PRINT "COCO 3 DETECTED":A$="SESB.BIN":B$="INSTSESB.BIN":GOTO 40
30 A$="ESB.BIN":B$="INSTESB.BIN"
40 PRINT "LOAD ROM, OFFSET INTO LOWER RAM"
50 LOADM A$,33024
60 PRINT "LOAD INSTALLER"
70 LOADM B$
80 PRINT "TURN OFF DRIVE MOTOR"
90 POKE 65344,0
100 PRINT "EXECUTE"
110 EXEC