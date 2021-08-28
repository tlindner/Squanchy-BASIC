all: calc_org sb.bin ssb.bin install.asm SQUANCHY.DSK

calc_org: calc_org.c
	cc -Wall -Werror $^ -o $@

sb.bin: equates.asm bas.asm calc_org
# Determine length of ROM
	lwasm -D BASIC_START=0 -o /dev/null equates.asm bas.asm --symbol-dump=$@.sym
# Assemble again with perfect offset
	lwasm -D BASIC_START=`./calc_org sb.bin.sym` -o $@ equates.asm bas.asm --list=$@.lst --symbol-dump=$@.sym

ssb.bin: equates.asm bas.asm calc_org
# Determine length of ROM
	lwasm -D COCO3 -D BASIC_START=0 -o /dev/null equates.asm bas.asm --symbol-dump=$@.sym
# Assemble again with perfect offset
	lwasm -D COCO3 -D BASIC_START=`./calc_org ssb.bin.sym` -o $@ equates.asm bas.asm --list=$@.lst --symbol-dump=$@.sym

instsb.bin: sb.bin.sym install.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

instssb.bin: ssb.bin.sym install.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

SQUANCHY.DSK: readme.bas s.bas squanchy.bas instsb.bin instssb.bin sb.bin ssb.bin
	decb dskini SQUANCHY.DSK
	decb copy -t readme.bas SQUANCHY.DSK,README.BAS
	decb copy -t s.bas SQUANCHY.DSK,S.BAS
	decb copy -t squanchy.bas SQUANCHY.DSK,SQUANCHY.BAS
	decb copy -2b instsb.bin SQUANCHY.DSK,INSTSB.BIN
	decb copy -2b instssb.bin SQUANCHY.DSK,INSTSSB.BIN
	decb copy -2b sb.bin SQUANCHY.DSK,SB.BIN
	decb copy -2b ssb.bin SQUANCHY.DSK,SSB.BIN

clean:
	-rm -f *.bin *.lst *.sym SQUANCHY.DSK
