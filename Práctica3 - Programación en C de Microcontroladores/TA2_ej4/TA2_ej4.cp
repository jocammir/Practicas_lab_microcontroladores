#line 1 "C:/Users/Estudiante/Desktop/TA2_ej4/TA2_ej4.c"
void Dragon_Ball_GT();

void main() {
ANSEL = 0x00;
ANSELH = 0x00;

C1ON_bit = 0x00;
C2ON_bit = 0x00;

Sound_Init(&PORTE, 2);

 while(1){
 Dragon_Ball_GT();
 }
}

void Dragon_Ball_GT(){
 Sound_Play(784, 550);
 delay_ms(100);
 Sound_Play(784, 550);
 delay_ms(100);
 Sound_Play(659, 300);
 Sound_Play(698, 300);
 Sound_Play(784, 300);
 Sound_Play(880, 300);
 Sound_Play(784, 550);
 Sound_Play(698, 550);
 Sound_Play(659, 550);
 Sound_Play(587, 650);

 Sound_Play(659, 550);
 delay_ms(100);
 Sound_Play(659, 550);
 delay_ms(100);
 Sound_Play(523, 300);
 Sound_Play(587, 300);
 Sound_Play(659, 300);
 Sound_Play(698, 300);
 Sound_Play(659, 550);
 Sound_Play(587, 550);
 Sound_Play(523, 550);
 Sound_Play(494, 550);
 Sound_Play(440, 550);
 delay_ms(1000);
}
