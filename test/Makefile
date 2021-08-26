all: deep-gosub deep-fornext CB-DG.wav CB-FN.wav CB-p30.wav CB-p55.wav CB-p63.wav CB-p64.wav CB-p80.wav CB-p85.wav CB-p96.wav CB-p113.wav CB-p125.wav CB-p128.wav CB-p135.wav CB-p137.wav CB-p138.wav CB-p140.wav CB-KL.wav CB-RAF.wav CB-SG.wav CB-BB.wav CB-ED.wav CB-PBYT.wav CB-ISV.wav CB-DIM.wav CB-SIN.wav CB-DIM2.wav

deep-gosub: deep-gosub.c
	cc -Wall -Werror $^ -o $@

deep-fornext: deep-fornext.c
	cc -Wall -Werror $^ -o $@

CB-DG.bas: deep-gosub Makefile
	./deep-gosub 1100 >CB-DG.bas

CB-FN.bas: deep-fornext Makefile
	./deep-fornext 10 >CB-FN.bas

%.wav: %.bas
	cecb bulkerase -l0.05 $(basename $@).wav
	cecb copy -t $^ $@,$(basename $<)

clean:
	-rm -f *.wav deep-gosub CB-DG.bas deep-fornext CB-FN.bas
