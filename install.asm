* Copy Squanchy basic to high RAM

* This is the byte length of this routine
CODE_SIZE set 25
	org $8000-(BASIC_END-BASIC_START+CODE_SIZE)
begin
	orcc #$50 disable irq,firq
* copy ROMs to final locations
	ldx #$8000-(BASIC_END-BASIC_START)
	lds #BASIC_START
loop ldb ,x+
	stb ,s+
	cmpx #$8000
	bne loop
* Tell BASIC to do a cold start
	lda #$0
	sta RSTFLG
* Jump to BASIC
	jmp RESVEC
	end begin
