#line 1 "D:/OneDrive/Área de Trabalho/PIC-TESTE/Bluetooth/4 Variaveis/variaveis.c"





char GLCD_DataPort at PORTD;
sbit GLCD_CS1 at RA5_bit;
sbit GLCD_CS2 at RC0_bit;
sbit GLCD_RS at RE0_bit;
sbit GLCD_RW at RE1_bit;
sbit GLCD_EN at RE2_bit;
sbit GLCD_RST at RB3_bit;
sbit GLCD_CS1_Direction at TRISA5_bit;
sbit GLCD_CS2_Direction at TRISC0_bit;
sbit GLCD_RS_Direction at TRISE0_bit;
sbit GLCD_RW_Direction at TRISE1_bit;
sbit GLCD_EN_Direction at TRISE2_bit;
sbit GLCD_RST_Direction at TRISB3_bit;

char str[] = "123|456|789";
char tempo[11], pulso[11], freq[11];

void main()
{
 delay_ms(200);
 CMCON = 0x07;
 ADCON0 = 0x00;
 ADCON1 = 0X0F;

 TRISD=0x00;
 TRISB=0XF0;

 Glcd_Init();
 Glcd_Fill(0);
 Glcd_Set_Font(Font_Glcd_System5x7,5,7,32);

 delay_ms(100);
 while (1)
 {

 if ( RB4_bit  == 0)
 {
 strcpy(tempo, strtok(str , "|"));
 strcpy(pulso, strtok(0, "|"));
 strcpy(freq , strtok(0, "|"));
 Glcd_Write_Text(tempo,10,2,1);
 Glcd_Write_Text(pulso,10,3,1);
 Glcd_Write_Text(freq,10,5,1);
 }
 }
}
