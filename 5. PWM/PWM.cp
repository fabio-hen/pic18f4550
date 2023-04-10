#line 1 "D:/OneDrive/Área de Trabalho/PIC/TCC/5. PWM/PWM.c"
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


int freq = 1 ;
short int temp = 10 ;
int larg = 50 ;
unsigned short int dose = 0 ;
unsigned short int sel = 1;
char disp1[8] ;
char disp2[8] ;
char disp3[8] ;
char disp4[8] ;







void main() org 0x1000
{
 trisb2_bit = 1 ;
 trisb4_bit = 1 ;
 trisb5_bit = 1 ;
 trisb6_bit = 1 ;
 trisb7_bit = 1 ;
 delay_ms(3000);
 adcon1=0x0F;
 trisd=0x00;
 rcon=0x80;
 cmcon=0x0F;
 intcon2=0;
 Glcd_Init();
 Glcd_Fill(0);
 Glcd_Set_Font(Font_Glcd_System5x7,5,7,32);
 delay_ms(100);
 glcd_write_text("Eletroestimulador",10,3,1) ;
 delay_ms(3000) ;
 pwm1_init (5000) ;
 Glcd_Fill(0);
 ;
 while(1)
 {
 while (sel==8)
 {
 glcd_write_text("Intensidade (mA):",10,3,1) ;
 delay_ms(100) ;
 inttostr(dose,disp4) ; ;
 glcd_write_text(disp4,10,5,1) ;
 delay_ms(100) ;
 pwm1_set_duty((dose*255)/100 ) ;
 if (dose<=0)
 {
 dose = 0 ;
 }
 if (dose>=100)
 {
 dose = 100 ;
 }
 if ( rb2_bit ==0)
 {
 sel = 1 ;
 dose = 0 ;
 PWM1_Stop();
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 if ( rb6_bit ==0)
 {
 if (dose<100)
 {
 dose++ ;
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 else
 {
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 }

 if ( rb7_bit ==0)
 {
 if (dose>0)
 {
 dose-- ;
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 else
 {
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 }
 }
 if (sel<1)
 {
 sel=1 ;
 }
 if (sel>3)
 {
 sel=3 ;
 }
 while (sel==1)
 {
 glcd_write_text("Frequencia (Hz):",10,3,1) ;
 delay_ms(100) ;
 inttostr(freq,disp1) ; ;
 glcd_write_text(disp1,10,5,1) ;
 delay_ms(100) ;
 if (freq<1)
 {
 freq=1 ;
 }
 if (freq>250)
 {
 freq=250 ;
 }
 if ( rb4_bit ==0)
 {
 sel-- ;
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 if ( rb5_bit ==0)
 {
 sel++ ;
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 if ( rb6_bit ==0)
 {
 if (freq>=10)
 {
 freq = freq+10 ;
 }
 else
 {
 freq++ ;
 }
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 if ( rb7_bit ==0)
 {
 if (freq<=10)
 {
 freq-- ;
 }
 else
 {
 freq = freq-10 ;
 }
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 if ( rb2_bit ==0)
 {
 sel = 8 ;
 pwm1_start() ;
 glcd_fill(0) ;
 delay_ms(100) ;
 }
 }
 }
}
