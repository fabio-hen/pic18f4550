
_main:

;Bluetooth.c,12 :: 		void main()
;Bluetooth.c,14 :: 		CMCON = 0x07;                   //Desabilita os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;Bluetooth.c,15 :: 		ADCON0 = 0x00;                  //Desabilita os conversores AD
	CLRF        ADCON0+0 
;Bluetooth.c,16 :: 		ADCON1 = 0X0F;                  // Torna todo ADC Digital
	MOVLW       15
	MOVWF       ADCON1+0 
;Bluetooth.c,18 :: 		TRISD=0x00;                     // define a porta d como saída
	CLRF        TRISD+0 
;Bluetooth.c,19 :: 		PORTD=0x00;                     //zera a porta d
	CLRF        PORTD+0 
;Bluetooth.c,21 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Bluetooth.c,22 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;Bluetooth.c,24 :: 		UART1_Write_Text("Start");      //Escreve o texto
	MOVLW       ?lstr1_Bluetooth+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_Bluetooth+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Bluetooth.c,25 :: 		UART1_Write(10);                //Realimentação de linha
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Bluetooth.c,26 :: 		UART1_Write(13);                //Quebra de linha - Enter
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Bluetooth.c,28 :: 		while (1)
L_main1:
;Bluetooth.c,30 :: 		if (UART1_Data_Ready())       // If data is received,
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;Bluetooth.c,32 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;Bluetooth.c,33 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Bluetooth.c,35 :: 		switch (uart_rd)
	GOTO        L_main4
;Bluetooth.c,37 :: 		case '0': LED0  = 0x01; break;
L_main6:
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
	GOTO        L_main5
;Bluetooth.c,38 :: 		case '1': LED1  = 0x01; break;
L_main7:
	BSF         RD1_bit+0, BitPos(RD1_bit+0) 
	GOTO        L_main5
;Bluetooth.c,39 :: 		case '2': LED2  = 0x01; break;
L_main8:
	BSF         RD2_bit+0, BitPos(RD2_bit+0) 
	GOTO        L_main5
;Bluetooth.c,40 :: 		case '3': LED3  = 0x01; break;
L_main9:
	BSF         RD3_bit+0, BitPos(RD3_bit+0) 
	GOTO        L_main5
;Bluetooth.c,41 :: 		case '4': LED4  = 0x01; break;
L_main10:
	BSF         RD4_bit+0, BitPos(RD4_bit+0) 
	GOTO        L_main5
;Bluetooth.c,42 :: 		case '5': LED5  = 0x01; break;
L_main11:
	BSF         RD5_bit+0, BitPos(RD5_bit+0) 
	GOTO        L_main5
;Bluetooth.c,43 :: 		case '6': LED6  = 0x01; break;
L_main12:
	BSF         RD6_bit+0, BitPos(RD6_bit+0) 
	GOTO        L_main5
;Bluetooth.c,44 :: 		case '7': LED7  = 0x01; break;
L_main13:
	BSF         RD7_bit+0, BitPos(RD7_bit+0) 
	GOTO        L_main5
;Bluetooth.c,45 :: 		case '8': PORTD = 0x00; break;
L_main14:
	CLRF        PORTD+0 
	GOTO        L_main5
;Bluetooth.c,46 :: 		}
L_main4:
	MOVF        _uart_rd+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
	MOVF        _uart_rd+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
	MOVF        _uart_rd+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
	MOVF        _uart_rd+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
	MOVF        _uart_rd+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVF        _uart_rd+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        _uart_rd+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVF        _uart_rd+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
	MOVF        _uart_rd+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
L_main5:
;Bluetooth.c,47 :: 		}
L_main3:
;Bluetooth.c,48 :: 		}
	GOTO        L_main1
;Bluetooth.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
