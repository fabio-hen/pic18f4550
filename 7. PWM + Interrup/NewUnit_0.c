// --- Mapeamento de Hardware ---
#define out  LATB7_bit

// --- Interrupções ---
void interrupt()
{
    if(INT0IF_bit)         //Houve interrupção externa?
    {                      //Sim...
        INT0IF_bit = 0x00; //limpa flag INT0IF

        out = ~out;        //inverte saída


    } //end if INT0IF

} //end interrupt


// --- Função Principal ---
void main()
{
     INTCON  = 0x90;       //Habilita interrupção global e interrupção externa 0 (1001 0000) (GIE/GIEH E INT0IE)
     INTEDG0_bit = 0x00;   //Configura interrupção externa 0 por borda de descida
     TRISB   = 0x7F;       //RB0 está configurado como saída (0111 1111b)
     ADCON1  = 0x0F;       //Configura os pinos do PORTB como digitais

     out     = 0x00;        //Inicializa saída de teste em low

     while(1)              //Loop infinito
     {
        //aguarda as interrupções...
        out = ~out;        //inverte saída
        delay_ms(1000);


     } // end while


} // end main