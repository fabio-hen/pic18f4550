
_interrupt:

;Interrup__o.c,26 :: 		void interrupt()
;Interrup__o.c,28 :: 		if(TMR0IF_bit)                            //Houve overflow do Timer0?
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;Interrup__o.c,30 :: 		TMR0IF_bit = 0x00;                    //Limpa flag
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;Interrup__o.c,31 :: 		TMR0L      = 0x42;                    //Reinicia byte menos significativo do Timer0
	MOVLW       66
	MOVWF       TMR0L+0 
;Interrup__o.c,32 :: 		TMR0H      = 0xfe;                    //Reinicia byte mais significativo do Timer0
	MOVLW       254
	MOVWF       TMR0H+0 
;Interrup__o.c,34 :: 		counter=counter+1;                            //Incrementa contador auxiliar
	MOVF        _counter+0, 0 
	MOVWF       R0 
	MOVF        _counter+1, 0 
	MOVWF       R1 
	MOVF        _counter+2, 0 
	MOVWF       R2 
	MOVF        _counter+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _counter+0 
	MOVF        R1, 0 
	MOVWF       _counter+1 
	MOVF        R2, 0 
	MOVWF       _counter+2 
	MOVF        R3, 0 
	MOVWF       _counter+3 
;Interrup__o.c,36 :: 		if(counter == 1)
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _counter+0, 0 
	MOVWF       R0 
	MOVF        _counter+1, 0 
	MOVWF       R1 
	MOVF        _counter+2, 0 
	MOVWF       R2 
	MOVF        _counter+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt1
;Interrup__o.c,38 :: 		cvrcon = 0xe7;
	MOVLW       231
	MOVWF       CVRCON+0 
;Interrup__o.c,39 :: 		}
L_interrupt1:
;Interrup__o.c,40 :: 		if(counter == 6)
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       64
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	MOVF        _counter+0, 0 
	MOVWF       R0 
	MOVF        _counter+1, 0 
	MOVWF       R1 
	MOVF        _counter+2, 0 
	MOVWF       R2 
	MOVF        _counter+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt2
;Interrup__o.c,42 :: 		cvrcon = 0xee;
	MOVLW       238
	MOVWF       CVRCON+0 
;Interrup__o.c,43 :: 		}
L_interrupt2:
;Interrup__o.c,44 :: 		if(counter == 11)
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       48
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        _counter+0, 0 
	MOVWF       R0 
	MOVF        _counter+1, 0 
	MOVWF       R1 
	MOVF        _counter+2, 0 
	MOVWF       R2 
	MOVF        _counter+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt3
;Interrup__o.c,46 :: 		cvrcon = 0xe0;
	MOVLW       224
	MOVWF       CVRCON+0 
;Interrup__o.c,47 :: 		}
L_interrupt3:
;Interrup__o.c,48 :: 		if(counter == 16)
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        _counter+0, 0 
	MOVWF       R0 
	MOVF        _counter+1, 0 
	MOVWF       R1 
	MOVF        _counter+2, 0 
	MOVWF       R2 
	MOVF        _counter+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt4
;Interrup__o.c,50 :: 		cvrcon = 0xe7;
	MOVLW       231
	MOVWF       CVRCON+0 
;Interrup__o.c,51 :: 		}
L_interrupt4:
;Interrup__o.c,52 :: 		if(counter == 40)                   //counter igual a 10?
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	MOVF        _counter+0, 0 
	MOVWF       R0 
	MOVF        _counter+1, 0 
	MOVWF       R1 
	MOVF        _counter+2, 0 
	MOVWF       R2 
	MOVF        _counter+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt5
;Interrup__o.c,54 :: 		counter = 0;                    //Reinicia counter
	CLRF        _counter+0 
	CLRF        _counter+1 
	CLRF        _counter+2 
	CLRF        _counter+3 
;Interrup__o.c,56 :: 		} //end if counter
L_interrupt5:
;Interrup__o.c,59 :: 		} //end if TMR0IF
L_interrupt0:
;Interrup__o.c,62 :: 		}//end interrupt
L_end_interrupt:
L__interrupt10:
	RETFIE      1
; end of _interrupt

_main:

;Interrup__o.c,66 :: 		void main()
;Interrup__o.c,69 :: 		INTCON  = 0xA0;                           //Habilita interrupção global e interrupção do Timer0
	MOVLW       160
	MOVWF       INTCON+0 
;Interrup__o.c,73 :: 		TMR0ON_bit = 0x01;                        //bit 7: Liga o Timer0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;Interrup__o.c,74 :: 		T08BIT_bit = 0x00;                        //bit 6: Habilita o modo de 16 bits para o Timer0
	BCF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;Interrup__o.c,75 :: 		T0CS_bit   = 0x00;                        //bit 5: Timer0 incrementa com o ciclo de máquina
	BCF         T0CS_bit+0, BitPos(T0CS_bit+0) 
;Interrup__o.c,76 :: 		PSA_bit    = 0x01;                        //bit 3: Timer0 sem prescaler (1:1)
	BSF         PSA_bit+0, BitPos(PSA_bit+0) 
;Interrup__o.c,78 :: 		ra2_bit = 1;
	BSF         RA2_bit+0, BitPos(RA2_bit+0) 
;Interrup__o.c,79 :: 		cvrcon = 0xef;
	MOVLW       239
	MOVWF       CVRCON+0 
;Interrup__o.c,85 :: 		TMR0L      = 0xff;                        //byte menos significativo
	MOVLW       255
	MOVWF       TMR0L+0 
;Interrup__o.c,86 :: 		TMR0H      = 0xff;                        //byte mais significativo
	MOVLW       255
	MOVWF       TMR0H+0 
;Interrup__o.c,102 :: 		TRISa   = 0xFC;                           //RB7, RB6 configurados como saída (0011 1111b)
	MOVLW       252
	MOVWF       TRISA+0 
;Interrup__o.c,103 :: 		ADCON1  = 0x0F;                           //Configura os pinos do PORTB como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;Interrup__o.c,107 :: 		outP     = 0x01;                          //Inicializa saída polling em high
	BSF         RA0_bit+0, BitPos(RA0_bit+0) 
;Interrup__o.c,108 :: 		outT0    = 0x00;                          //Inicializa saída T0 em low
	BCF         RA1_bit+0, BitPos(RA1_bit+0) 
;Interrup__o.c,111 :: 		while(1)                                  //Loop infinito
L_main6:
;Interrup__o.c,113 :: 		outP = ~outP;                          //inverte saída polling
	BTG         RA0_bit+0, BitPos(RA0_bit+0) 
;Interrup__o.c,114 :: 		delay_ms(500);                         //aguarda 500ms
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;Interrup__o.c,117 :: 		} // end while
	GOTO        L_main6
;Interrup__o.c,119 :: 		} // end main
L_end_main:
	GOTO        $+0
; end of _main
