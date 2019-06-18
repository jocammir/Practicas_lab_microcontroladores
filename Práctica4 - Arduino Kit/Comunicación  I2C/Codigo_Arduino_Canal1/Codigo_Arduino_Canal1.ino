/*CODIGO RELIZADO POR SALVADOR RUIZ SEDEÑO
PAGINA WEB: WWW.FROSTCODE.ES
VIDEOTUTORIAL DEL CODIGO EN YOUTUBE AQUI: https://www.youtube.com/watch?v=7_ysvfLmBww
*/



#include <Wire.h>


void setup()
{
  Wire.begin(1); // Abrimos el canal 1 (0x01) del I2C
  Wire.onRequest(peticion);// Creamos el evento que se relaizará cuando el Receptor llame a el emisor (Este Arduino)
  Serial.begin(9600);
}

void loop()
{
}

void peticion() 
{
  Serial.print("Se pidio el mensaje, Enviando");//Imprimios cuando el receptor  nos pide el mensaje
  Wire.write("Hola soy el canal 1");//Imprimimos cuando se realize la peticion ese mensaje y lo enviaremos por el canal 1
}




