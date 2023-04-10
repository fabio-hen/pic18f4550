
_interrupt:

;PWM___Interrup.c,27 :: 		void interrupt()
;PWM___Interrup.c,29 :: 		if(TMR0IF_bit)                            //Houve overflow do Timer0?
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;PWM___Interrup.c,31 :: 		TMR0IF_bit = 0x00;                    //Limpa flag
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;PWM___Interrup.c,32 :: 		TMR0L      = 0x42;                    //Reinicia byte menos significativo do Timer0
	MOVLW       66
	MOVWF       TMR0L+0 
;PWM___Interrup.c,33 :: 		TMR0H      = 0xfe;                    //Reinicia byte mais significativo do Timer0
	MOVLW       254
	MOVWF       TMR0H+0 
;PWM___Interrup.c,35 :: 		counter=counter+1;                            //Incrementa contador auxiliar
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
;PWM___Interrup.c,64 :: 		} //end if TMR0IF
L_interrupt0:
;PWM___Interrup.c,67 :: 		}//end interrupt
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;PWM___Interrup.c,71 :: 		void main()
;PWM___Interrup.c,74 :: 		INTCON  = 0xA0;                           //Habilita interrupção global e interrupção do Timer0
	MOVLW       160
	MOVWF       INTCON+0 
;PWM___Interrup.c,78 :: 		TMR0ON_bit = 0x01;                        //bit 7: Liga o Timer0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;PWM___Interrup.c,79 :: 		T08BIT_bit = 0x00;                        //bit 6: Habilita o modo de 16 bits para o Timer0
	BCF         T08BIT_bit+0, BitPos(T08BIT_bit+0) 
;PWM___Interrup.c,80 :: 		T0CS_bit   = 0x00;                        //bit 5: Timer0 incrementa com o ciclo de máquina
	BCF         T0CS_bit+0, BitPos(T0CS_bit+0) 
;PWM___Interrup.c,81 :: 		PSA_bit    = 0x01;                        //bit 3: Timer0 sem prescaler (1:1)
	BSF         PSA_bit+0, BitPos(PSA_bit+0) 
;PWM___Interrup.c,83 :: 		ra2_bit = 1;
	BSF         RA2_bit+0, BitPos(RA2_bit+0) 
;PWM___Interrup.c,84 :: 		cvrcon = 0xef;
	MOVLW       239
	MOVWF       CVRCON+0 
;PWM___Interrup.c,90 :: 		TMR0L      = 0xff;                        //byte menos significativo
	MOVLW       255
	MOVWF       TMR0L+0 
;PWM___Interrup.c,91 :: 		TMR0H      = 0xff;                        //byte mais significativo
	MOVLW       255
	MOVWF       TMR0H+0 
;PWM___Interrup.c,107 :: 		trisb6_bit = 1 ;
	BSF         TRISB6_bit+0, BitPos(TRISB6_bit+0) 
;PWM___Interrup.c,108 :: 		trisb7_bit = 1 ;
	BSF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;PWM___Interrup.c,109 :: 		TRISB   = 0x7F;       //RB0 está configurado como saída (0111 1111b)
	MOVLW       127
	MOVWF       TRISB+0 
;PWM___Interrup.c,110 :: 		ADCON1  = 0x0F;                           //Configura os pinos do PORTB como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;PWM___Interrup.c,115 :: 		while(1)                                  //Loop infinito
L_main1:
;PWM___Interrup.c,117 :: 		cvrcon = 0xee;                   //pos
	MOVLW       238
	MOVWF       CVRCON+0 
;PWM___Interrup.c,118 :: 		delay_us(916);                   // aguarda 500us
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
;PWM___Interrup.c,119 :: 		cvrcon = 0xe0;                   //negativo
	MOVLW       224
	MOVWF       CVRCON+0 
;PWM___Interrup.c,120 :: 		delay_us(916);                   // aguarda 500us
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
;PWM___Interrup.c,121 :: 		cvrcon = 0xe7;                   // aguarda 3000us
	MOVLW       231
	MOVWF       CVRCON+0 
;PWM___Interrup.c,122 :: 		delay_us(5500);
	MOVLW       86
	MOVWF       R12, 0
	MOVLW       181
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;PWM___Interrup.c,123 :: 		} // end while
	GOTO        L_main1
;PWM___Interrup.c,125 :: 		} // end main
L_end_main:
	GOTO        $+0
; end of _main
