#define LED0  RD0_bit
#define LED1  RD1_bit
#define LED2  RD2_bit
#define LED3  RD3_bit
#define LED4  RD4_bit
#define LED5  RD5_bit
#define LED6  RD6_bit
#define LED7  RD7_bit

char uart_rd;

void main() 
{
  CMCON = 0x07;                   //Desabilita os comparadores
  ADCON0 = 0x00;                  //Desabilita os conversores AD
  ADCON1 = 0X0F;                  // Torna todo ADC Digital
  
  TRISD=0x00;                     // define a porta d como saída
  PORTD=0x00;                     //zera a porta d
  
  UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize

  UART1_Write_Text("Start");      //Escreve o texto
  UART1_Write(10);                //Realimentação de linha
  UART1_Write(13);                //Quebra de linha - Enter

  while (1) 
  {                               // Endless loop
    
     LED0  = 0x01; break;
     delay_us(250);
     LED1  = 0x01; break;
     delay_us(250);
    if (UART1_Data_Ready())       // If data is received,
    {
      uart_rd = UART1_Read();     // read the received data,
      UART1_Write(uart_rd);       // and send data via UART
      
      switch (uart_rd)
      {
       case '0': LED0  = 0x01; break;
       case '1': LED1  = 0x01; break;
       case '2': LED2  = 0x01; break;
       case '3': LED3  = 0x01; break;
       case '4': LED4  = 0x01; break;
       case '5': LED5  = 0x01; break;
       case '6': LED6  = 0x01; break;
       case '7': LED7  = 0x01; break;
       case '8': PORTD = 0x00; break;
      }
    }
  }
}