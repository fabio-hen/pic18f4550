
_main:

;Bluetooth.c,6 :: 		void main() org 0x1000
;Bluetooth.c,8 :: 		delay_ms(1000); // Delay para estabilizar
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;Bluetooth.c,9 :: 		adcon1=0x0F; //Passa alguns pinos do pic para formato digital
	MOVLW       15
	MOVWF       ADCON1+0 
;Bluetooth.c,10 :: 		trisb=0x00;  // define a porta d como saída
	CLRF        TRISB+0 
;Bluetooth.c,11 :: 		portb=0x00; //zera a porta d
	CLRF        PORTB+0 
;Bluetooth.c,12 :: 		rcon=0x80;
	MOVLW       128
	MOVWF       RCON+0 
;Bluetooth.c,13 :: 		cmcon=0x0F;
	MOVLW       15
	MOVWF       CMCON+0 
;Bluetooth.c,14 :: 		intcon2=0;
	CLRF        INTCON2+0 
;Bluetooth.c,16 :: 		UART1_Init(9600);//inicia o modulo UART com velocidade de 9600bps
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Bluetooth.c,17 :: 		delay_ms(100);//espere 10ms para estabilizar
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
;Bluetooth.c,19 :: 		while(1)
L_main2:
;Bluetooth.c,21 :: 		if (UART1_Data_Ready())      // If data is received
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;Bluetooth.c,23 :: 		uart_rd[i] = UART1_Read();     // read the received data
	MOVLW       _uart_rd+0
	MOVWF       FLOC__main+0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FLOC__main+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__main+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__main+1, 1 
	CALL        _UART1_Read+0, 0
	MOVFF       FLOC__main+0, FSR1L+0
	MOVFF       FLOC__main+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Bluetooth.c,25 :: 		i++;
	INCF        _i+0, 1 
;Bluetooth.c,26 :: 		}
L_main4:
;Bluetooth.c,27 :: 		string = strstr(uart_rd,"on");
	MOVLW       _uart_rd+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr1_Bluetooth+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr1_Bluetooth+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _string+0 
	MOVF        R1, 0 
	MOVWF       _string+1 
;Bluetooth.c,28 :: 		if(string != 0) {
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main9
	MOVLW       0
	XORWF       R0, 0 
L__main9:
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;Bluetooth.c,29 :: 		portb=0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Bluetooth.c,30 :: 		string[0] = 0;  // clear string
	MOVFF       _string+0, FSR1L+0
	MOVFF       _string+1, FSR1H+0
	CLRF        POSTINC1+0 
;Bluetooth.c,31 :: 		i=0;   // reset i
	CLRF        _i+0 
;Bluetooth.c,32 :: 		}
L_main5:
;Bluetooth.c,33 :: 		string = strstr(uart_rd,"off");
	MOVLW       _uart_rd+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr2_Bluetooth+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr2_Bluetooth+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _string+0 
	MOVF        R1, 0 
	MOVWF       _string+1 
;Bluetooth.c,34 :: 		if(string != 0) {
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVLW       0
	XORWF       R0, 0 
L__main10:
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;Bluetooth.c,35 :: 		portb=0x00;
	CLRF        PORTB+0 
;Bluetooth.c,36 :: 		string[0] = 0;  // clear string
	MOVFF       _string+0, FSR1L+0
	MOVFF       _string+1, FSR1H+0
	CLRF        POSTINC1+0 
;Bluetooth.c,37 :: 		i=0;   // reset i
	CLRF        _i+0 
;Bluetooth.c,38 :: 		}
L_main6:
;Bluetooth.c,39 :: 		if(i==500){
	MOVLW       0
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVLW       244
	XORWF       _i+0, 0 
L__main11:
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;Bluetooth.c,40 :: 		i=0;
	CLRF        _i+0 
;Bluetooth.c,41 :: 		}
L_main7:
;Bluetooth.c,42 :: 		}
	GOTO        L_main2
;Bluetooth.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
