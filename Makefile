all: calc_org bas13.bin install.asm SQUANCHY.DSK

calc_org: calc_org.c
	cc -Wall -Werror $^ -o $@

bas13.bin: equates.asm bas.asm calc_org bas13.bin.sym
# Determine length of ROM
	lwasm -D BASIC_START=0 -o /dev/null equates.asm bas.asm --symbol-dump=$@.sym
# Assemble again with perfect offset
	lwasm -D BASIC_START=`./calc_org bas13.bin.sym` -o $@ equates.asm bas.asm --list=$@.lst --symbol-dump=$@.sym

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
