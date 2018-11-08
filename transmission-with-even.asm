    org 0000h

    mov scon, #11000010b
    mov tmod, #20h
    mov th1, #0f4h
    setb tr1
    mov a, #'a'
    call adc_par
    call tx_e
    mov a, #'l'
    call adc_par
    call tx_e
    mov a, #'o'
    call adc_par
    call tx_e

adc_par:anl a,
        mov c, p
        mov tb8, c
        ret

tx_e:jmp ti, $
     clr ti
     mov sbuf, a
     ret

end