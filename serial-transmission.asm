	org 0000h

	mov sp, #30h
	mov scon, #42h
	mov tmod, #20h
	mov th1, #0f4h
	setb tr1
main:	mov a, #'a'
	call envia
	mov a, #'l'
	call envia
	mov a, #'o'
	call envia
	jmp main
envia:	jnb ti, $
	clr ti
	mov sbuf, a
	ret
end
