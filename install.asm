 org $5000
begin orcc #$50 disable irq,firq
* copy ROMs to final locations
 ldx #$6000
 lds #$df00
loop ldd ,x++
 std ,s++
 cmpx #$8000
 bne loop
* Tell BASIC to do a cold start
 lda #$0
 sta RSTFLG
* Jump to BASIC
 jmp RESVEC
 end begin
