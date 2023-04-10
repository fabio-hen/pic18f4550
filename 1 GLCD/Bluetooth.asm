
_main:

;Bluetooth.c,18 :: 		void main() org 0x1000
;Bluetooth.c,20 :: 		delay_ms(3000); // Delay para estabilizar
	MOVLW       183
	MOVWF       R11, 0
	MOVLW       161
	MOVWF       R12, 0
	MOVLW       195
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
;Bluetooth.c,21 :: 		adcon1=0x0F; //Passa alguns pinos do pic para formato digital
	MOVLW       15
	MOVWF       ADCON1+0 
;Bluetooth.c,22 :: 		trisd=0x00;  // define a porta d como saída
	CLRF        TRISD+0 
;Bluetooth.c,23 :: 		rcon=0x80;
	MOVLW       128
	MOVWF       RCON+0 
;Bluetooth.c,24 :: 		cmcon=0x0F;
	MOVLW       15
	MOVWF       CMCON+0 
;Bluetooth.c,25 :: 		intcon2=0;
	CLRF        INTCON2+0 
;Bluetooth.c,27 :: 		UART1_Init(9600);//inicia o modulo UART com velocidade de 9600bps
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Bluetooth.c,28 :: 		delay_ms(100);//espere 10ms para estabilizar
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
;Bluetooth.c,30 :: 		Glcd_Init(); //Inicializar o GLCD
	CALL        _Glcd_Init+0, 0
;Bluetooth.c,31 :: 		Glcd_Fill(0);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;Bluetooth.c,32 :: 		Glcd_Set_Font(Font_Glcd_System5x7,5,7,32);
	MOVLW       _Font_Glcd_System5x7+0
	MOVWF       FARG_Glcd_Set_Font_activeFont+0 
	MOVLW       hi_addr(_Font_Glcd_System5x7+0)
	MOVWF       FARG_Glcd_Set_Font_activeFont+1 
	MOVLW       higher_addr(_Font_Glcd_System5x7+0)
	MOVWF       FARG_Glcd_Set_Font_activeFont+2 
	MOVLW       5
	MOVWF       FARG_Glcd_Set_Font_aFontWidth+0 
	MOVLW       7
	MOVWF       FARG_Glcd_Set_Font_aFontHeight+0 
	MOVLW       32
	MOVWF       FARG_Glcd_Set_Font_aFontOffs+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Set_Font_aFontOffs+1 
	CALL        _Glcd_Set_Font+0, 0
;Bluetooth.c,34 :: 		delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;Bluetooth.c,35 :: 		Glcd_Write_Text(msg,10,3,1);
	MOVLW       _msg+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       3
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Bluetooth.c,37 :: 		while(1)
L_main3:
;Bluetooth.c,39 :: 		if (UART1_Data_Ready() == 1)
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Bluetooth.c,41 :: 		UART1_Read_Text(txt, "//",16);
	MOVLW       _txt+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr1_Bluetooth+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr1_Bluetooth+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       16
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;Bluetooth.c,42 :: 		delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
;Bluetooth.c,43 :: 		Glcd_Write_Text(txt,40,5,1);
	MOVLW       _txt+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       40
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;Bluetooth.c,44 :: 		}
L_main5:
;Bluetooth.c,45 :: 		}
	GOTO        L_main3
;Bluetooth.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
