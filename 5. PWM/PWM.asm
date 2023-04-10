
_main:

;PWM.c,32 :: 		void main() org 0x1000
;PWM.c,34 :: 		trisb2_bit = 1 ;
	BSF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;PWM.c,35 :: 		trisb4_bit = 1 ;
	BSF         TRISB4_bit+0, BitPos(TRISB4_bit+0) 
;PWM.c,36 :: 		trisb5_bit = 1 ;
	BSF         TRISB5_bit+0, BitPos(TRISB5_bit+0) 
;PWM.c,37 :: 		trisb6_bit = 1 ;
	BSF         TRISB6_bit+0, BitPos(TRISB6_bit+0) 
;PWM.c,38 :: 		trisb7_bit = 1 ;
	BSF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;PWM.c,39 :: 		delay_ms(3000); // Delay para estabilizar
	MOVLW       77
	MOVWF       R11, 0
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       79
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
;PWM.c,40 :: 		adcon1=0x0F; //Passa alguns pinos do pic para formato digital
	MOVLW       15
	MOVWF       ADCON1+0 
;PWM.c,41 :: 		trisd=0x00;  // define a porta d como saída
	CLRF        TRISD+0 
;PWM.c,42 :: 		rcon=0x80;
	MOVLW       128
	MOVWF       RCON+0 
;PWM.c,43 :: 		cmcon=0x0F;
	MOVLW       15
	MOVWF       CMCON+0 
;PWM.c,44 :: 		intcon2=0;
	CLRF        INTCON2+0 
;PWM.c,45 :: 		Glcd_Init(); //Inicializar o GLCD
	CALL        _Glcd_Init+0, 0
;PWM.c,46 :: 		Glcd_Fill(0);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,47 :: 		Glcd_Set_Font(Font_Glcd_System5x7,5,7,32);
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
;PWM.c,48 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
	NOP
;PWM.c,49 :: 		glcd_write_text("Eletroestimulador",10,3,1)     ;
	MOVLW       ?lstr1_PWM+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr1_PWM+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       3
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;PWM.c,50 :: 		delay_ms(3000)   ;
	MOVLW       77
	MOVWF       R11, 0
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       79
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;PWM.c,51 :: 		pwm1_init (5000)       ;
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;PWM.c,52 :: 		Glcd_Fill(0);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,54 :: 		while(1)
L_main3:
;PWM.c,56 :: 		while (sel==8)
L_main5:
	MOVF        _sel+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;PWM.c,58 :: 		glcd_write_text("Intensidade (mA):",10,3,1)     ;
	MOVLW       ?lstr2_PWM+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr2_PWM+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       3
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;PWM.c,59 :: 		delay_ms(100)                             ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;PWM.c,60 :: 		inttostr(dose,disp4)                       ;                       ;
	MOVF        _dose+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _disp4+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_disp4+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;PWM.c,61 :: 		glcd_write_text(disp4,10,5,1)     ;
	MOVLW       _disp4+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(_disp4+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;PWM.c,62 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;PWM.c,63 :: 		pwm1_set_duty((dose*255)/100 )      ;
	MOVLW       255
	MULWF       _dose+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PWM.c,64 :: 		if (dose<=0)
	MOVF        _dose+0, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_main9
;PWM.c,66 :: 		dose = 0                         ;
	CLRF        _dose+0 
;PWM.c,67 :: 		}
L_main9:
;PWM.c,68 :: 		if (dose>=100)
	MOVLW       100
	SUBWF       _dose+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main10
;PWM.c,70 :: 		dose = 100                       ;
	MOVLW       100
	MOVWF       _dose+0 
;PWM.c,71 :: 		}
L_main10:
;PWM.c,72 :: 		if (start==0)
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main11
;PWM.c,74 :: 		sel = 1      ;
	MOVLW       1
	MOVWF       _sel+0 
;PWM.c,75 :: 		dose = 0     ;
	CLRF        _dose+0 
;PWM.c,76 :: 		PWM1_Stop();
	CALL        _PWM1_Stop+0, 0
;PWM.c,77 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,78 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
	NOP
;PWM.c,79 :: 		}
L_main11:
;PWM.c,80 :: 		if (up==0)
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_main13
;PWM.c,82 :: 		if (dose<100)
	MOVLW       100
	SUBWF       _dose+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;PWM.c,84 :: 		dose++                              ;
	INCF        _dose+0, 1 
;PWM.c,85 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,86 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
	NOP
;PWM.c,87 :: 		}
	GOTO        L_main16
L_main14:
;PWM.c,90 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,91 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
	NOP
;PWM.c,92 :: 		}
L_main16:
;PWM.c,93 :: 		}
L_main13:
;PWM.c,95 :: 		if (down==0)
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main18
;PWM.c,97 :: 		if (dose>0)
	MOVF        _dose+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main19
;PWM.c,99 :: 		dose--                              ;
	DECF        _dose+0, 1 
;PWM.c,100 :: 		glcd_fill(0)                        ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,101 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	DECFSZ      R11, 1, 1
	BRA         L_main20
	NOP
	NOP
;PWM.c,102 :: 		}
	GOTO        L_main21
L_main19:
;PWM.c,105 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,106 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
	NOP
;PWM.c,107 :: 		}
L_main21:
;PWM.c,108 :: 		}
L_main18:
;PWM.c,109 :: 		}
	GOTO        L_main5
L_main6:
;PWM.c,110 :: 		if (sel<1)
	MOVLW       1
	SUBWF       _sel+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main23
;PWM.c,112 :: 		sel=1      ;
	MOVLW       1
	MOVWF       _sel+0 
;PWM.c,113 :: 		}
L_main23:
;PWM.c,114 :: 		if (sel>3)
	MOVF        _sel+0, 0 
	SUBLW       3
	BTFSC       STATUS+0, 0 
	GOTO        L_main24
;PWM.c,116 :: 		sel=3      ;
	MOVLW       3
	MOVWF       _sel+0 
;PWM.c,117 :: 		}
L_main24:
;PWM.c,118 :: 		while (sel==1)
L_main25:
	MOVF        _sel+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main26
;PWM.c,120 :: 		glcd_write_text("Frequencia (Hz):",10,3,1)     ;
	MOVLW       ?lstr3_PWM+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr3_PWM+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       3
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;PWM.c,121 :: 		delay_ms(100)                             ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
	NOP
;PWM.c,122 :: 		inttostr(freq,disp1)                       ;                       ;
	MOVF        _freq+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _freq+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _disp1+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_disp1+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;PWM.c,123 :: 		glcd_write_text(disp1,10,5,1)     ;
	MOVLW       _disp1+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(_disp1+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;PWM.c,124 :: 		delay_ms(100) ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main28:
	DECFSZ      R13, 1, 1
	BRA         L_main28
	DECFSZ      R12, 1, 1
	BRA         L_main28
	DECFSZ      R11, 1, 1
	BRA         L_main28
	NOP
	NOP
;PWM.c,125 :: 		if (freq<1)
	MOVLW       128
	XORWF       _freq+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main46
	MOVLW       1
	SUBWF       _freq+0, 0 
L__main46:
	BTFSC       STATUS+0, 0 
	GOTO        L_main29
;PWM.c,127 :: 		freq=1                          ;
	MOVLW       1
	MOVWF       _freq+0 
	MOVLW       0
	MOVWF       _freq+1 
;PWM.c,128 :: 		}
L_main29:
;PWM.c,129 :: 		if (freq>250)
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _freq+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main47
	MOVF        _freq+0, 0 
	SUBLW       250
L__main47:
	BTFSC       STATUS+0, 0 
	GOTO        L_main30
;PWM.c,131 :: 		freq=250                          ;
	MOVLW       250
	MOVWF       _freq+0 
	MOVLW       0
	MOVWF       _freq+1 
;PWM.c,132 :: 		}
L_main30:
;PWM.c,133 :: 		if (back==0)
	BTFSC       RB4_bit+0, BitPos(RB4_bit+0) 
	GOTO        L_main31
;PWM.c,135 :: 		sel--                           ;
	DECF        _sel+0, 1 
;PWM.c,136 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,137 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
	NOP
	NOP
;PWM.c,138 :: 		}
L_main31:
;PWM.c,139 :: 		if (next==0)
	BTFSC       RB5_bit+0, BitPos(RB5_bit+0) 
	GOTO        L_main33
;PWM.c,141 :: 		sel++                           ;
	INCF        _sel+0, 1 
;PWM.c,142 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,143 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	DECFSZ      R11, 1, 1
	BRA         L_main34
	NOP
	NOP
;PWM.c,144 :: 		}
L_main33:
;PWM.c,145 :: 		if (up==0)
	BTFSC       RB6_bit+0, BitPos(RB6_bit+0) 
	GOTO        L_main35
;PWM.c,147 :: 		if (freq>=10)
	MOVLW       128
	XORWF       _freq+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main48
	MOVLW       10
	SUBWF       _freq+0, 0 
L__main48:
	BTFSS       STATUS+0, 0 
	GOTO        L_main36
;PWM.c,149 :: 		freq = freq+10               ;
	MOVLW       10
	ADDWF       _freq+0, 1 
	MOVLW       0
	ADDWFC      _freq+1, 1 
;PWM.c,150 :: 		}
	GOTO        L_main37
L_main36:
;PWM.c,153 :: 		freq++              ;
	INFSNZ      _freq+0, 1 
	INCF        _freq+1, 1 
;PWM.c,154 :: 		}
L_main37:
;PWM.c,155 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,156 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 1
	BRA         L_main38
	DECFSZ      R12, 1, 1
	BRA         L_main38
	DECFSZ      R11, 1, 1
	BRA         L_main38
	NOP
	NOP
;PWM.c,157 :: 		}
L_main35:
;PWM.c,158 :: 		if (down==0)
	BTFSC       RB7_bit+0, BitPos(RB7_bit+0) 
	GOTO        L_main39
;PWM.c,160 :: 		if (freq<=10)
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _freq+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main49
	MOVF        _freq+0, 0 
	SUBLW       10
L__main49:
	BTFSS       STATUS+0, 0 
	GOTO        L_main40
;PWM.c,162 :: 		freq--               ;
	MOVLW       1
	SUBWF       _freq+0, 1 
	MOVLW       0
	SUBWFB      _freq+1, 1 
;PWM.c,163 :: 		}
	GOTO        L_main41
L_main40:
;PWM.c,166 :: 		freq = freq-10              ;
	MOVLW       10
	SUBWF       _freq+0, 1 
	MOVLW       0
	SUBWFB      _freq+1, 1 
;PWM.c,167 :: 		}
L_main41:
;PWM.c,168 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,169 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 1
	BRA         L_main42
	DECFSZ      R12, 1, 1
	BRA         L_main42
	DECFSZ      R11, 1, 1
	BRA         L_main42
	NOP
	NOP
;PWM.c,170 :: 		}
L_main39:
;PWM.c,171 :: 		if (start==0)
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main43
;PWM.c,173 :: 		sel = 8      ;
	MOVLW       8
	MOVWF       _sel+0 
;PWM.c,174 :: 		pwm1_start() ;
	CALL        _PWM1_Start+0, 0
;PWM.c,175 :: 		glcd_fill(0)                       ;
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;PWM.c,176 :: 		delay_ms(100)                       ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 1
	BRA         L_main44
	DECFSZ      R12, 1, 1
	BRA         L_main44
	DECFSZ      R11, 1, 1
	BRA         L_main44
	NOP
	NOP
;PWM.c,177 :: 		}
L_main43:
;PWM.c,178 :: 		}
	GOTO        L_main25
L_main26:
;PWM.c,179 :: 		}
	GOTO        L_main3
;PWM.c,180 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
