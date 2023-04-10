/*
    Curso de Microcontroladores PIC WR Kits Channel

    Aula 93: Interrup��o do Timer0

    MCU: PIC18F4520   Clock: 4MHz   Ciclo de M�quina: 1us


    Autor: Eng. Wagner Rambo   Data: Agosto de 2016

    www.wrkits.com.br | youtube.com/user/canalwrkits | facebook.com/wrkits

*/

// --- Mapeamento de Hardware ---
#define  outP   ra0_bit                      //sa�da de teste oscilando em polling
#define  outT0  ra1_bit                      //sa�da de teste oscilando com Overflow do Timer0 e interrup��o


// --- Vari�veis Globais ---
float counter = 0;                          //contador auxiliar
int larg = 100;
int freq = 250;

// --- Interrup��es ---
void interrupt()
{
     if(TMR0IF_bit)                            //Houve overflow do Timer0?
     {                                         //Sim...
         TMR0IF_bit = 0x00;                    //Limpa flag
         TMR0L      = 0x42;                    //Reinicia byte menos significativo do Timer0
         TMR0H      = 0xfe;                    //Reinicia byte mais significativo do Timer0

         counter=counter+1;                            //Incrementa contador auxiliar

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
         if(counter == 40)                   //counter igual a 10?
         {                                     //Sim...
            counter = 0;                    //Reinicia counter

         } //end if counter


     } //end if TMR0IF


}//end interrupt


// --- Fun��o Principal ---
void main()
{
     // -- Registrador INTCON (pag 95 datasheet)
     INTCON  = 0xA0;                           //Habilita interrup��o global e interrup��o do Timer0
     // --

     // -- Registrador T0CON (pag 125 datasheet) --
     TMR0ON_bit = 0x01;                        //bit 7: Liga o Timer0
     T08BIT_bit = 0x00;                        //bit 6: Habilita o modo de 16 bits para o Timer0
     T0CS_bit   = 0x00;                        //bit 5: Timer0 incrementa com o ciclo de m�quina
     PSA_bit    = 0x01;                        //bit 3: Timer0 sem prescaler (1:1)
     // --
     ra2_bit = 1;
     cvrcon = 0xef;

     // -- Inicializa conte�do do Timer0 --
     //
     // Timer0 = 15536d = 3CB0h (para contar at� 50000d)
     //
     TMR0L      = 0xff;                        //byte menos significativo
     TMR0H      = 0xff;                        //byte mais significativo
     // --

     // -- Equa��o para Estouro do Timer0 --
     //
     //   Timer0_Ovf = (65536 - <TMR0H:TMR0L>) x prescaler T0 x ciclo de m�quina
     //
     //   Timer0_Ovf =    (65536 - 15536)      x       1      x      1E-6
     //
     //   Timer0_Ovf =    50 ms
     //
     //   Para garantir Ovf de 500ms : Timer0_Ovf x 10
     //
     // --


     TRISa   = 0xFC;                           //RB7, RB6 configurados como sa�da (0011 1111b)
     ADCON1  = 0x0F;                           //Configura os pinos do PORTB como digitais



     outP     = 0x01;                          //Inicializa sa�da polling em high
     outT0    = 0x00;                          //Inicializa sa�da T0 em low


     while(1)                                  //Loop infinito
     {
      outP = ~outP;                          //inverte sa�da polling
      delay_ms(500);                         //aguarda 500ms


     } // end while

} // end main