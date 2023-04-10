#line 1 "D:/OneDrive/Área de Trabalho/PIC/TCC/7. PWM + Interrup/NewUnit_0.c"




void interrupt()
{
 if(INT0IF_bit)
 {
 INT0IF_bit = 0x00;

  LATB7_bit  = ~ LATB7_bit ;


 }

}



void main()
{
 INTCON = 0x90;
 INTEDG0_bit = 0x00;
 TRISB = 0x7F;
 ADCON1 = 0x0F;

  LATB7_bit  = 0x00;

 while(1)
 {

  LATB7_bit  = ~ LATB7_bit ;
 delay_ms(1000);


 }


}
