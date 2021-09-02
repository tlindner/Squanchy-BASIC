all: calc_org desb.bin sesb.bin esb.bin sb.bin ssb.bin install.asm SQUANCHY.DSK

calc_org: calc_org.c
	cc -Wall -Werror $^ -o $@

# Squanchy BASIC
sb.bin: equates.asm bas.asm calc_org
	lwasm -D COLBASIC -D BASIC_START=32768 -o /dev/null equates.asm bas.asm --symbol-dump=$@.sym
	lwasm -D COLBASIC -D BASIC_START=`./calc_org sb.bin.sym` -o $@ equates.asm bas.asm --list=$@.lst --symbol-dump=$@.sym

# Super Squanchy BASIC
ssb.bin: equates.asm bas.asm calc_org
	lwasm -D COLBASIC -D COCO3 -D BASIC_START=32768 -o /dev/null equates.asm bas.asm --symbol-dump=$@.sym
	lwasm -D COLBASIC -D COCO3 -D BASIC_START=`./calc_org ssb.bin.sym` -o $@ equates.asm bas.asm --list=$@.lst --symbol-dump=$@.sym

# Extended Squanchy BASIC
esb.bin: extbas.asm equates.asm bas.asm calc_org
	lwasm -D EXTBASIC -D BASIC_START=32768 -o /dev/null equates.asm bas.asm --symbol-dump=$@.sym
	lwasm -D EXTBASIC -D BASIC_START=`./calc_org esb.bin.sym` -o $@ equates.asm bas.asm --list=$@.lst --symbol-dump=$@.sym

# Super Extended Squanchy BASIC
sesb.bin: extbas.asm equates.asm bas.asm calc_org
	lwasm -D EXTBASIC -D COCO3 -D BASIC_START=32768 -o /dev/null equates.asm bas.asm --symbol-dump=$@.sym
	lwasm -D EXTBASIC -D COCO3 -D BASIC_START=`./calc_org sesb.bin.sym` -o $@ equates.asm bas.asm --list=$@.lst --symbol-dump=$@.sym

# Disk Extended Squanchy BASIC
desb.bin: disk.asm extbas.asm equates.asm bas.asm calc_org
	lwasm -D DISKBASIC -D EXTBASIC -D BASIC_START=32768 -o /dev/null equates.asm bas.asm --symbol-dump=$@.sym
	lwasm -D DISKBASIC -D EXTBASIC -D BASIC_START=`./calc_org desb.bin.sym` -o $@ equates.asm bas.asm --list=$@.lst --symbol-dump=$@.sym

instsb.bin: sb.bin.sym install.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

instssb.bin: ssb.bin.sym install.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

instesb.bin: esb.bin.sym install.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

instsesb.bin: sesb.bin.sym install.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

instdesb.bin: desb.bin.sym install.asm
	lwasm -o $@ $^ --list=$@.lst --symbol-dump=$@.sym

SQUANCHY.DSK: readme.bas desb.bas esb.bas sb.bas instdesb.bin instsb.bin instssb.bin sb.bin ssb.bin instesb.bin esb.bin instsesb.bin sesb.bin desb.bin
	decb dskini SQUANCHY.DSK
	decb copy -2b instsb.bin SQUANCHY.DSK,INSTSB.BIN
	decb copy -2b sb.bin SQUANCHY.DSK,SB.BIN
	decb copy -2b instssb.bin SQUANCHY.DSK,INSTSSB.BIN
	decb copy -2b ssb.bin SQUANCHY.DSK,SSB.BIN
	decb copy -2b instesb.bin SQUANCHY.DSK,INSTESB.BIN
	decb copy -2b esb.bin SQUANCHY.DSK,ESB.BIN
	decb copy -2b instsesb.bin SQUANCHY.DSK,INSTSESB.BIN
	decb copy -2b sesb.bin SQUANCHY.DSK,SESB.BIN
	decb copy -2b instdesb.bin SQUANCHY.DSK,INSTDESB.BIN
	decb copy -2b desb.bin SQUANCHY.DSK,DESB.BIN
	decb copy -t desb.bas SQUANCHY.DSK,DESB.BAS
	decb copy -t esb.bas SQUANCHY.DSK,ESB.BAS
	decb copy -t sb.bas SQUANCHY.DSK,SB.BAS
	decb copy -t readme.bas SQUANCHY.DSK,README.BAS

clean:
	-rm -f *.bin *.lst *.sym calc_org SQUANCHY.DSK
