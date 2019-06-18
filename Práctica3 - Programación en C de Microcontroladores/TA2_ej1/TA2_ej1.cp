#line 1 "C:/Users/Estudiante/Desktop/TA2_ej1/TA2_ej1.c"
int i = 0;
void main() {
ANSELH=0x00;
ANSEL=0x00;

TRISC=0x01;
TRISD=0x00;

PORTC=0x00;
PORTD=0x00;

 while(1){
 if(PORTC.RC0 == 1){
 i++;
 PORTD = i;
 delay_ms(1000);
 }
 else{
 PORTD = i;
 }
 }

}
