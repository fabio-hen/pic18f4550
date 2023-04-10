char *string;
char txt[]= "on";
char uart_rd[9];
char i=0;

void main() org 0x1000
{
     delay_ms(1000); // Delay para estabilizar
     adcon1=0x0F; //Passa alguns pinos do pic para formato digital
     trisb=0x00;  // define a porta d como saída
     portb=0x00; //zera a porta d
     rcon=0x80;
     cmcon=0x0F;
     intcon2=0;

     UART1_Init(9600);//inicia o modulo UART com velocidade de 9600bps
     delay_ms(100);//espere 10ms para estabilizar

     while(1)
     {
          if (UART1_Data_Ready())      // If data is received
          {
            uart_rd[i] = UART1_Read();     // read the received data
            //UART1_Write(uart_rd[i]);
            i++;
          }
          string = strstr(uart_rd,"on");
          if(string != 0) {
            portb=0xFF;
            string[0] = 0;  // clear string
            i=0;   // reset i
          }
          string = strstr(uart_rd,"off");
          if(string != 0) {
            portb=0x00;
            string[0] = 0;  // clear string
            i=0;   // reset i
          }
          if(i==500){
           i=0;
          }
     }
}