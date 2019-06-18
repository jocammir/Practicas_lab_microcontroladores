int cont=9;
char num[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7C,0x07,0x7F,0x6F};
char freq[]={100000,20000,10000,2000};
void main() {
C1ON_bit = 0x00;                      // Disable comparators
C2ON_bit = 0x00;

Sound_Init(&PORTE, 2);

ANSELH=0;
ANSEL=0;

TRISC=0x00;

PORTC=0x00;

  while (cont>=0)
    {
      PORTC = num[cont];
      cont--;
      delay_ms(1000);
      if (cont<3)
      {
          Sound_Play(freq[cont], 1000);
      }
      if (cont<0)
      {
      cont=9;
      }
    }

}