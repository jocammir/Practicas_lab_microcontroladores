// Arduino pin numbers
const int SW_pin = 2; // digital pin connected to switch output
const int X_pin = 0; // analog pin connected to X output
const int Y_pin = 1; // analog pin connected to Y output

void setup() {
  pinMode(SW_pin, INPUT);
  pinMode(13, OUTPUT);
  digitalWrite(SW_pin, HIGH);
  Serial.begin(9600);
}

void loop() {
  digitalWrite(13,LOW);
  Serial.print("Switch:  ");
  Serial.print(digitalRead(SW_pin));
  Serial.print(" ");
  Serial.print("X-axis: ");
  Serial.print(analogRead(X_pin));
  Serial.print(" ");
  Serial.print("Y-axis: ");
  Serial.println(analogRead(Y_pin));
  Serial.print("\n");
  if(digitalRead(SW_pin) <1){
    digitalWrite(13,HIGH);
    delay(500);
  }
  if(analogRead(Y_pin) == 0){
    digitalWrite(13,LOW);
  }
  if(analogRead(Y_pin) == 1023){
    digitalWrite(13,HIGH);
  }
  delay(500);
}
