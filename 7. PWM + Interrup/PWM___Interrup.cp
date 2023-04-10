#line 1 "D:/OneDrive/햞ea de Trabalho/PIC/TCC/7. PWM + Interrup/PWM___Interrup.c"
#line 22 "D:/OneDrive/햞ea de Trabalho/PIC/TCC/7. PWM + Interrup/PWM___Interrup.c"
float counter = 0;
int larg = 500;
int freq = 250;
unsigned short int dose = 0 ;

void interrupt()
{
 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0x00;
 TMR0L = 0x42;
 TMR0H = 0xfe;

 counter=counter+1;
#line 64 "D:/OneDrive/햞ea de Trabalho/PIC/TCC/7. PWM + Interrup/PWM___Interrup.c"
 }


}



void main()
{

 INTCON = 0xA0;



 TMR0ON_bit = 0x01;
 T08BIT_bit = 0x00;
 T0CS_bit = 0x00;
 PSA_bit = 0x01;

 ra2_bit = 1;
 cvrcon = 0xef;





 TMR0L = 0xff;
 TMR0H = 0xff;
#line 107 "D:/OneDrive/햞ea de Trabalho/PIC/TCC/7. PWM + Interrup/PWM___Interrup.c"
 trisb6_bit = 1 ;
 trisb7_bit = 1 ;
 TRISB = 0x7F;
 ADCON1 = 0x0F;




 while(1)
 {
 cvrcon = 0xee;
 delay_us(916);
 cvrcon = 0xe0;
 delay_us(916);
 cvrcon = 0xe7;
 delay_us(5500);
 }

}
