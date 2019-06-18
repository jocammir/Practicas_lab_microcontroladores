void Dragon_Ball_GT();

void main() {
ANSEL  = 0x00;                        // Configure AN pins as digital
ANSELH = 0x00;

C1ON_bit = 0x00;                      // Disable comparators
C2ON_bit = 0x00;

Sound_Init(&PORTE, 2);

  while(1){
   Dragon_Ball_GT();
  }
}

void Dragon_Ball_GT(){
     Sound_Play(784, 550); //SOL   // Frequency = 784Hz, duration = 550ms
     delay_ms(100);
     Sound_Play(784, 550); //SOL
     delay_ms(100);
     Sound_Play(659, 300); //MI
     Sound_Play(698, 300); //FA
     Sound_Play(784, 300); //SOL
     Sound_Play(880, 300); //LA
     Sound_Play(784, 550); //SOL
     Sound_Play(698, 550); //FA
     Sound_Play(659, 550); //MI
     Sound_Play(587, 650); //RE
     /*-------------------------*/
     Sound_Play(659, 550); //MI
     delay_ms(100);
     Sound_Play(659, 550); //MI
     delay_ms(100);
     Sound_Play(523, 300); //DO
     Sound_Play(587, 300); //RE
     Sound_Play(659, 300); //MI
     Sound_Play(698, 300); //FA
     Sound_Play(659, 550); //MI
     Sound_Play(587, 550); //RE
     Sound_Play(523, 550); //DO
     Sound_Play(494, 550); //SI
     Sound_Play(440, 550); //LA
     delay_ms(1000);
}





