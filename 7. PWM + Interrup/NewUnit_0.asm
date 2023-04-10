
_interrupt:

;NewUnit_0.c,5 :: 		void interrupt()
;NewUnit_0.c,7 :: 		if(INT0IF_bit)         //Houve interrupção externa?
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt0
;NewUnit_0.c,9 :: 		INT0IF_bit = 0x00; //limpa flag INT0IF
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;NewUnit_0.c,11 :: 		out = ~out;        //inverte saída
	BTG         LATB7_bit+0, BitPos(LATB7_bit+0) 
;NewUnit_0.c,14 :: 		} //end if INT0IF
L_interrupt0:
;NewUnit_0.c,16 :: 		} //end interrupt
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;NewUnit_0.c,20 :: 		void main()
;NewUnit_0.c,22 :: 		INTCON  = 0x90;       //Habilita interrupção global e interrupção externa 0 (1001 0000) (GIE/GIEH E INT0IE)
	MOVLW       144
	MOVWF       INTCON+0 
;NewUnit_0.c,23 :: 		INTEDG0_bit = 0x00;   //Configura interrupção externa 0 por borda de descida
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;NewUnit_0.c,24 :: 		TRISB   = 0x7F;       //RB0 está configurado como saída (0111 1111b)
	MOVLW       127
	MOVWF       TRISB+0 
;NewUnit_0.c,25 :: 		ADCON1  = 0x0F;       //Configura os pinos do PORTB como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;NewUnit_0.c,27 :: 		out     = 0x00;        //Inicializa saída de teste em low
	BCF         LATB7_bit+0, BitPos(LATB7_bit+0) 
;NewUnit_0.c,29 :: 		while(1)              //Loop infinito
L_main1:
;NewUnit_0.c,32 :: 		out = ~out;        //inverte saída
	BTG         LATB7_bit+0, BitPos(LATB7_bit+0) 
;NewUnit_0.c,33 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;NewUnit_0.c,36 :: 		} // end while
	GOTO        L_main1
;NewUnit_0.c,39 :: 		} // end main
L_end_main:
	GOTO        $+0
; end of _main
