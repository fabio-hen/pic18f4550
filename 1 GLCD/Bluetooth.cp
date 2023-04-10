#line 1 "D:/OneDrive/Área de Trabalho/PIC-TESTE/Bluetooth/1 GLCD/Bluetooth.c"
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

unsigned char msg [] = "Dado Recebido:";
unsigned char txt[20];

void main() org 0x1000
{
 delay_ms(3000);
 adcon1=0x0F;
 trisd=0x00;
 rcon=0x80;
 cmcon=0x0F;
 intcon2=0;

 UART1_Init(9600);
 delay_ms(100);

 Glcd_Init();
 Glcd_Fill(0);
 Glcd_Set_Font(Font_Glcd_System5x7,5,7,32);

 delay_ms(100);
 Glcd_Write_Text(msg,10,3,1);

 while(1)
 {
 if (UART1_Data_Ready() == 1)
 {
 UART1_Read_Text(txt, "//",16);
 delay_ms(10);
 Glcd_Write_Text(txt,40,5,1);
 }
 }
}
