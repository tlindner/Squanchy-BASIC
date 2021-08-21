all: bas13.bin install.asm SQUANCHY.DSK

bas13.bin: equates.asm bas.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

install.bin: bas13.bin.sym install.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

SQUANCHY.DSK: s.bas squanchy.bas install.bin bas13.bin
	decb dskini SQUANCHY.DSK
	decb copy -t s.bas SQUANCHY.DSK,S.BAS
	decb copy -t squanchy.bas SQUANCHY.DSK,SQUANCHY.BAS
	decb copy -2b install.bin SQUANCHY.DSK,INSTALL.BIN
	decb copy -2b bas13.bin SQUANCHY.DSK,BAS13.BIN

clean:
	-rm -f *.bin *.lst *.sym SQUANCHY.DSK
