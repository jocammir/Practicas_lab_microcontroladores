int i,j,k;
char PORT[8]={1,2,4,8,16,32,64,128};
char LETRA[8]={0x18, 0x24, 0x42, 0x42, 0x42, 0x7e, 0x42, 0x42};//LETRA A
char FIGURA[8]={0xce, 0x91, 0x21, 0x42, 0x42, 0x21, 0x91, 0xce};//CORAZON
char MENSAJE[]={0x00, 0x7e, 0x7e, 0x18, 0x18, 0x7e, 0x7e, 0x00, //H
                                0x00, 0x7e, 0x7e, 0x66, 0x66, 0x7e, 0x7e, 0x00, //O
                                0x00, 0x7e, 0x7e, 0x60, 0x60, 0x60, 0x60, 0x00, //L
                   0x00, 0x7e, 0x7e, 0x16, 0x16, 0x7e, 0x7e, 0x00, //A
                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}; //ESPACIO

void main() {
ANSELH=0x00;
ANSEL=0x00;

TRISC=0x00;
TRISD=0x00;
TRISB=0x00;
PORTB=0xFF;
           while(1){
           if(PORTB.RB0==0){
                //MATRIZ DE LEDS MOSTRANDO UNA LETRA O FIGURA
                for(i=0;i<8;i++)//PARA RECORRER EL ARREGLO
                {
                        PORTD = PORT[i];
                        PORTC = ~LETRA[i];
                        delay_ms(1);//PARA QUE SE MUESTRE EN LA MATRIZ SIN PARPADEOS
                }
           }
           if(PORTB.RB1==0){
                //MATRIZ DE LEDS MOSTRANDO UNA LETRA O FIGURA
                for(i=0;i<8;i++)//PARA RECORRER EL ARREGLO
                {
                        PORTD = PORT[i];
                        PORTC = ~FIGURA[i];
                        delay_ms(1);//PARA QUE SE MUESTRE EN LA MATRIZ SIN PARPADEOS
                }
           }
           if(PORTB.RB2==0){
                //MATRIZ DE LEDS CON DESPLAZAMIENTO DE UNA CADENA
                for (i=0;i<32;i++)//
                        {
                                for (k=0;k<50;k++)//
                                {
                                        for (j=0; j<8;j++)//
                                        {
                                                PORTD = PORT[j];
                                                PORTC = ~MENSAJE[i+j];// se niega para que se muestre en la matriz
                                                delay_ms(1);// delay para que se muestre en la matriz sin parpadeos
                                        }
                                }

                        }
           }
            }
}