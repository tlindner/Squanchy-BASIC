10 PCLEAR 1 : CLEAR 50, 8192
20 PRINT "LOAD SQUANCHY BASIC ROM, OFFSET INTO LOWER RAM"
30 LOADM "BAS13.BIN",33024
40 PRINT "LOAD INSTALLER"
50 LOADM "INSTALL.BIN"
60 PRINT "TURN OFF DRIVE MOTOR"
70 POKE 65344,0
80 PRINT "EXECUTE"
90 EXEC
