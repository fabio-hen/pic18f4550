/*
    Curso de Microcontroladores PIC WR Kits Channel

    Aula 93: Interrupção do Timer0

    MCU: PIC18F4520   Clock: 4MHz   Ciclo de Máquina: 1us


    Autor: Eng. Wagner Rambo   Data: Agosto de 2016

    www.wrkits.com.br | youtube.com/user/canalwrkits | facebook.com/wrkits

*/

// --- Mapeamento de Hardware ---

#define up     rb5_bit
#define down   rb6_bit
#define out    rb7_bit

// --- Variáveis Globais ---
float counter = 0;                          //contador auxiliar
int larg = 500;
int freq = 250;
unsigned short int dose = 0 ;
// --- Interrupções ---
void interrupt()
{
     if(TMR0IF_bit)                            //Houve overflow do Timer0?
     {                                         //Sim...
         TMR0IF_bit = 0x00;                    //Limpa flag
         TMR0L      = 0x42;                    //Reinicia byte menos significativo do Timer0
         TMR0H      = 0xfe;                    //Reinicia byte mais significativo do Timer0

         counter=counter+1;                            //Incrementa contador auxiliar
            /*
         if(counter == 1)
         {
           cvrcon = 0xe7;
           out = 0;
         }
         if(counter == 6)
         {
            cvrcon = 0xee;
             out = 0;
         }
         if(counter == 11)
         {
            cvrcon = 0xe0;
             out = 0;
         }
          if(counter == 16)
         {
            cvrcon = 0xe7;
             out = 0;
         }
         if(counter == 40)                   //counter igual a 10?
         {                                     //Sim...
            counter = 0;                    //Reinicia counter

         } //end if counter

       */
     } //end if TMR0IF


}//end interrupt


// --- Função Principal ---
void main()
{
     // -- Registrador INTCON (pag 95 datasheet)
     INTCON  = 0xA0;                           //Habilita interrupção global e interrupção do Timer0
     // --

     // -- Registrador T0CON (pag 125 datasheet) --
     TMR0ON_bit = 0x01;                        //bit 7: Liga o Timer0
     T08BIT_bit = 0x00;                        //bit 6: Habilita o modo de 16 bits para o Timer0
     T0CS_bit   = 0x00;                        //bit 5: Timer0 incrementa com o ciclo de máquina
     PSA_bit    = 0x01;                        //bit 3: Timer0 sem prescaler (1:1)
     // --
     ra2_bit = 1;
     cvrcon = 0xef;

     // -- Inicializa conteúdo do Timer0 --
     //
     // Timer0 = 15536d = 3CB0h (para contar até 50000d)
     //
     TMR0L      = 0xff;                        //byte menos significativo
     TMR0H      = 0xff;                        //byte mais significativo
     // --

     // -- Equação para Estouro do Timer0 --
     //
     //   Timer0_Ovf = (65536 - <TMR0H:TMR0L>) x prescaler T0 x ciclo de máquina
     //
     //   Timer0_Ovf =    (65536 - 15536)      x       1      x      1E-6
     //
     //   Timer0_Ovf =    50 ms
     //
     //   Para garantir Ovf de 500ms : Timer0_Ovf x 10
     //
     // --


     trisb6_bit = 1 ;
     trisb7_bit = 1 ;
     TRISB   = 0x7F;       //RB0 está configurado como saída (0111 1111b)
     ADCON1  = 0x0F;                           //Configura os pinos do PORTB como digitais
     //pwm1_init (5000)       ;
     //pwm1_start() ;


     while(1)                                  //Loop infinito
     {
         cvrcon = 0xee;                   //pos
         delay_us(916);                   // aguarda 500us
         cvrcon = 0xe0;                   //negativo
         delay_us(916);                   // aguarda 500us
         cvrcon = 0xe7;                   // aguarda 3000us
         delay_us(5500);
     } // end while

} // end main