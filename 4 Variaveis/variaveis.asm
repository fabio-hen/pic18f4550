
_main:

;variaveis.c,23 :: 		void main()
;variaveis.c,25 :: 		delay_ms(200);                  // Delay para estabilizar
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
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
;variaveis.c,26 :: 		CMCON = 0x07;                   //Desabilita os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;variaveis.c,27 :: 		ADCON0 = 0x00;                  //Desabilita os conversores AD
	CLRF        ADCON0+0 
;variaveis.c,28 :: 		ADCON1 = 0X0F;                  // Torna todo ADC Digital
	MOVLW       15
	MOVWF       ADCON1+0 
;variaveis.c,30 :: 		TRISD=0x00;                     // define a porta d como saída
	CLRF        TRISD+0 
;variaveis.c,31 :: 		TRISB=0XF0;                     // define a porta b0-3 como saida (0) e b4-7 como entrada (1) (11110000)
	MOVLW       240
	MOVWF       TRISB+0 
;variaveis.c,33 :: 		Glcd_Init(); //Inicializar o GLCD
	CALL        _Glcd_Init+0, 0
;variaveis.c,34 :: 		Glcd_Fill(0);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;variaveis.c,35 :: 		Glcd_Set_Font(Font_Glcd_System5x7,5,7,32);
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
;variaveis.c,37 :: 		delay_ms(100);
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
;variaveis.c,38 :: 		while (1)
L_main2:
;variaveis.c,41 :: 		if (BUT0 == 0)
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_main4
;variaveis.c,43 :: 		strcpy(tempo, strtok(str , "|"));
	MOVLW       _str+0
	MOVWF       FARG_strtok_s1+0 
	MOVLW       hi_addr(_str+0)
	MOVWF       FARG_strtok_s1+1 
	MOVLW       ?lstr1_variaveis+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr1_variaveis+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _tempo+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tempo+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;variaveis.c,44 :: 		strcpy(pulso, strtok(0, "|"));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr2_variaveis+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr2_variaveis+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _pulso+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_pulso+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;variaveis.c,45 :: 		strcpy(freq , strtok(0, "|"));
	CLRF        FARG_strtok_s1+0 
	CLRF        FARG_strtok_s1+1 
	MOVLW       ?lstr3_variaveis+0
	MOVWF       FARG_strtok_s2+0 
	MOVLW       hi_addr(?lstr3_variaveis+0)
	MOVWF       FARG_strtok_s2+1 
	CALL        _strtok+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_strcpy_from+0 
	MOVF        R1, 0 
	MOVWF       FARG_strcpy_from+1 
	MOVLW       _freq+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_freq+0)
	MOVWF       FARG_strcpy_to+1 
	CALL        _strcpy+0, 0
;variaveis.c,46 :: 		Glcd_Write_Text(tempo,10,2,1);
	MOVLW       _tempo+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(_tempo+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       2
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;variaveis.c,47 :: 		Glcd_Write_Text(pulso,10,3,1);
	MOVLW       _pulso+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(_pulso+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       3
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;variaveis.c,48 :: 		Glcd_Write_Text(freq,10,5,1);
	MOVLW       _freq+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(_freq+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;variaveis.c,49 :: 		}
L_main4:
;variaveis.c,50 :: 		}
	GOTO        L_main2
;variaveis.c,51 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
