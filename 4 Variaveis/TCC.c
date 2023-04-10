#include <stdio.h>
#include <string.h>//necessário para strtok;
#include <stdlib.h>

#define LED0  RB0_bit
#define LED1  RB1_bit
#define LED2  RB2_bit
#define BUT0  RB4_bit
#define BUT1  RB5_bit
#define BUT2  RB6_bit
#define BUT3  RB7_bit

char GLCD_DataPort at PORTD;
sbit GLCD_CS1 at RA5_bit;
sbit GLCD_CS2 at RC0_bit;
sbit GLCD_RS  at RE0_bit;
sbit GLCD_RW  at RE1_bit;
sbit GLCD_EN at RE2_bit;
sbit GLCD_RST at RB3_bit;
sbit GLCD_CS1_Direction at TRISA5_bit;
sbit GLCD_CS2_Direction at TRISC0_bit;
sbit GLCD_RS_Direction at TRISE0_bit;
sbit GLCD_RW_Direction at TRISE1_bit;
sbit GLCD_EN_Direction at TRISE2_bit;
sbit GLCD_RST_Direction at TRISB3_bit;

char Data_In[20]; // string that have to be parsed
char str_val[10]; // pointer to the first character of a token
int M1, M2, M3; // values extracted from string
char C1[20];
char C2[20];
char C3[20];
unsigned char msg [] = "LED PRESIONADO:";

void main()
{
  delay_ms(200);                  // Delay para estabilizar
  CMCON = 0x07;                   //Desabilita os comparadores
  ADCON0 = 0x00;                  //Desabilita os conversores AD
  ADCON1 = 0X0F;                  // Torna todo ADC Digital

  TRISD=0x00;                     // define a porta d como saída
  TRISB=0XF0;                     // define a porta b0-3 como saida (0) e b4-7 como entrada (1) (11110000)

  UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize

  Glcd_Init(); //Inicializar o GLCD
  Glcd_Fill(0);
  Glcd_Set_Font(Font_Glcd_System5x7,5,7,32);

  delay_ms(100);
  Glcd_Write_Text(msg,10,1,1);

  UART1_Write_Text("Start");      //Escreve o texto
  UART1_Write(10);                //Realimentação de linha
  UART1_Write(13);                //Quebra de linha - Enter
  UART1_Write_Text(51);

  while (1)
  {
    if (UART1_Data_Ready() == 1)
    {
      UART1_Read_Text(Data_In, "set",16);
      delay_ms(10);

      strcpy(str_val,strtok(Data_In, ";")); //take the first value
      //M1 = atoi(str_val); //convert string to INT

      strcpy(str_val,strtok(0, ";")); //take the secound value
      //M2 = atoi(str_val); //convert string to INT

      strcpy(str_val,strtok(0, ";")); //take the third value
      //M3 = atoi(str_val); //convert string to INT

      inttostr(M1,C1);
      inttostr(M1,C2);
      inttostr(M1,C3);
      Glcd_Write_Text(C1,10,3,1);
      Glcd_Write_Text(M1,30,4,1);
      Glcd_Write_Text(C2,10,4,1);
      Glcd_Write_Text(M2,30,4,1);
      Glcd_Write_Text(C3,10,5,1);
      Glcd_Write_Text(M3,30,5,1);
    }

    if (BUT0 == 0)
    {
      LED0 = 1;
      Glcd_Write_Text("0",10,4,1);
    }

    if (BUT1 == 0)
    {
      LED1 = 1;
      Glcd_Write_Text("1",10,4,1);
    }

    if (BUT2 == 0)
    {
      LED2 = 1;
      Glcd_Write_Text("2",10,4,1);
    }
    if (BUT3 == 0)
    {
      LED0 = 0;
      LED1 = 0;
      LED2 = 0;
      Glcd_Write_Text("TODOS APAGADOS",10,4,1);
    }
  }
}