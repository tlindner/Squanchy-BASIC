all: deep-expression CB-DE.wav deep-gosub CB-DG.wav deep-fornext CB-FN.wav CB-p30.wav CB-p55.wav CB-p63.wav CB-p64.wav CB-p80.wav CB-p85.wav CB-p96.wav CB-p113.wav CB-p125.wav CB-p128.wav CB-p135.wav CB-p137.wav CB-p138.wav CB-p140.wav CB-KL.wav CB-RAF.wav CB-SG.wav CB-BB.wav CB-ED.wav CB-PBYT.wav CB-ISV.wav CB-DIM.wav CB-SIN.wav CB-DIM2.wav CB-p208.wav ECB-DG.wav ECB-p227.wav DOS.wav ECB-p187.wav ECB-PU.wav ECB-POS.wav ECB-DFN.wav ECB-GRA.wav ECB-DRA.wav

deep-expression: deep-expression.c
	cc -g -Wall -Werror $^ -o $@

deep-gosub: deep-gosub.c
	cc -Wall -Werror $^ -o $@

deep-fornext: deep-fornext.c
	cc -Wall -Werror $^ -o $@

CB-DG.bas: deep-gosub Makefile
	./deep-gosub 1100 >CB-DG.bas

ECB-DG.bas: deep-gosub Makefile
	./deep-gosub 850 >ECB-DG.bas

CB-FN.bas: deep-fornext Makefile
	./deep-fornext 10 >CB-FN.bas

CB-DE.bas: deep-expression Makefile
	./deep-expression 100 >CB-DE.bas

%.wav: %.bas
	cecb bulkerase -l0.05 $(basename $@).wav
	cecb copy -t $^ $@,$(basename $<)

clean:
	-rm -f *.wav deep-gosub ECB-DG.bas CB-DG.bas deep-fornext CB-FN.bas deep-expression CB-DE.bas
