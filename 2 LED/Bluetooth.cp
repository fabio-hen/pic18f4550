#line 1 "D:/OneDrive/Área de Trabalho/PIC-TESTE/Bluetooth/2 LED/Bluetooth.c"
char *string;
char txt[]= "on";
char uart_rd[9];
char i=0;

void main() org 0x1000
{
 delay_ms(1000);
 adcon1=0x0F;
 trisb=0x00;
 portb=0x00;
 rcon=0x80;
 cmcon=0x0F;
 intcon2=0;

 UART1_Init(9600);
 delay_ms(100);

 while(1)
 {
 if (UART1_Data_Ready())
 {
 uart_rd[i] = UART1_Read();

 i++;
 }
 string = strstr(uart_rd,"on");
 if(string != 0) {
 portb=0xFF;
 string[0] = 0;
 i=0;
 }
 string = strstr(uart_rd,"off");
 if(string != 0) {
 portb=0x00;
 string[0] = 0;
 i=0;
 }
 if(i==500){
 i=0;
 }
 }
}
