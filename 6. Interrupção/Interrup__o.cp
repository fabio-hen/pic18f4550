#line 1 "D:/OneDrive/Área de Trabalho/PIC/TCC/6. Interrupção/Interrup__o.c"
#line 21 "D:/OneDrive/Área de Trabalho/PIC/TCC/6. Interrupção/Interrup__o.c"
float counter = 0;
int larg = 100;
int freq = 250;


void interrupt()
{
 if(TMR0IF_bit)
 {
 TMR0IF_bit = 0x00;
 TMR0L = 0x42;
 TMR0H = 0xfe;

 counter=counter+1;

 if(counter == 1)
 {
 cvrcon = 0xe7;
 }
 if(counter == 6)
 {
 cvrcon = 0xee;
 }
 if(counter == 11)
 {
 cvrcon = 0xe0;
 }
 if(counter == 16)
 {
 cvrcon = 0xe7;
 }
 if(counter == 40)
 {
 counter = 0;

 }


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
#line 102 "D:/OneDrive/Área de Trabalho/PIC/TCC/6. Interrupção/Interrup__o.c"
 TRISa = 0xFC;
 ADCON1 = 0x0F;



  ra0_bit  = 0x01;
  ra1_bit  = 0x00;


 while(1)
 {
  ra0_bit  = ~ ra0_bit ;
 delay_ms(500);


 }

}
