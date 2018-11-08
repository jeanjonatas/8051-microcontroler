	org 0000h
	jmp inicio

	org 0023h
	cjne r1, #43h, armaz
	clr ea
	jmp fim
armaz:	mov a, sbuf
	mov @r1, a
	inc r1
fim:	clr ri
	reti

inicio:	mov sp, #30h
	mov scon, #50h
	mov tmod, #20h
	mov th1, #0fdh
	mov ie, #90h
	mov r1, #40h
	orl pcon, #10000000b
	setb tr1
main:

	jmp main
end
	
