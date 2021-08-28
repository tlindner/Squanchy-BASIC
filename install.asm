* Copy Squanchy basic to high RAM

* This is the byte length of this routine
CODE_SIZE set 33
	org $8000-(BASIC_END-BASIC_START+CODE_SIZE)
begin
	orcc #$50 disable irq,firq
* Set RAM mode
	sta $ffdf
* Clear from $8000 to start of BASIC
	ldx #$8000
loop1
	clr ,x+
	cmpx #BASIC_START
	bne loop1
* Copy BASIC to high RAM
	ldy #$8000-(BASIC_END-BASIC_START)
loop2
	lda ,y+
	sta ,x+
	cmpx #$ff00
	bne loop2
* Tell BASIC to do a cold start
	clr RSTFLG
* Jump to BASIC
	jmp RESVEC
install_end
	end begin
