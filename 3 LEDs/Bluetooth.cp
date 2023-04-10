#line 1 "D:/OneDrive/Área de Trabalho/PIC-TESTE/Bluetooth/3 LEDs/Bluetooth.c"









char uart_rd;

void main()
{
 CMCON = 0x07;
 ADCON0 = 0x00;
 ADCON1 = 0X0F;

 TRISD=0x00;
 PORTD=0x00;

 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write_Text("Start");
 UART1_Write(10);
 UART1_Write(13);

 while (1)
 {
 if (UART1_Data_Ready())
 {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);

 switch (uart_rd)
 {
 case '0':  RD0_bit  = 0x01; break;
 case '1':  RD1_bit  = 0x01; break;
 case '2':  RD2_bit  = 0x01; break;
 case '3':  RD3_bit  = 0x01; break;
 case '4':  RD4_bit  = 0x01; break;
 case '5':  RD5_bit  = 0x01; break;
 case '6':  RD6_bit  = 0x01; break;
 case '7':  RD7_bit  = 0x01; break;
 case '8': PORTD = 0x00; break;
 }
 }
 }
}
