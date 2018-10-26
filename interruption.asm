			org 0000h                       ;Inicializando programa
            JMP inicio                      ;jmp pra rotina principal do programa

            org 0003h                       ; Inicio da rotina de interrupção
			CPL F0
            MOV R0, #0FH
            RETI                            ; Retorno da rotina de interrupção

inicio:     MOV SP, #40h                    ;movendo o stack pointer
            MOV A, #10000000B  
            MOV IE, A                       ;Setando enable all e habilitando a interrupção
            MOV TCON, #00000001B            ;Setando o tcon pra ser sensível a borda
            MOV A, #00000001B       
	       	MOV P1,A                        ;Movendo a saída do led para a posição
	        MOV R0,#0FH                     ;Setando a flag de controle do r0
principal:
	        MOV TH0, #0FFH                    ;Movendo TH0 para fazer o delay
	        MOV TL0, #0FH                   ;Movendo o timer para o TL0
	        SETB TR0                        ;Habilitando o Timer
	        JNB TF0,$                       ;Delay do led
	        CLR TF0                         ;Limpando o TF0    
	        DJNZ R0,principal               ;Decrementa e desvia caso seja igual a 0   
   			MOV R0, #0FH                    ;Move novamente o valor pra r0 para o controle     
	        JB F0, direita                  ;Desvia se ativo para a direita
	        CJNE A,#10000000B,esquerda      ;Desvia para a es
            MOV A, #00000001B
            JMP principal
esquerda:
	        MOV A,P1
	        RL A
	        MOV P1,A
	        JMP principal
direita: 
	        MOV A,P1
	        RR A
	        MOV P1,A
	        JMP principal
	    
