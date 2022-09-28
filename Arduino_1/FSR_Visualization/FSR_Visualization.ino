// Defining the Analog inputs
int vol0 = A7;
int vol1 = A6;
int vol2 = A5;
int vol3 = A4;
int vol4 = A3;
int vol5 = A2;
// int vol6 = A1;

// Void Setup -> Just for initiating the baud rate
void setup() {
  Serial.begin(9600);
}

void loop() {
  // sensor #1
  Serial.print(analogRead(vol0));
  Serial.print("-");
  
  // sensor #2
  Serial.print(analogRead(vol1));
  Serial.print("-");
  
  // sensor #3
  Serial.print(analogRead(vol2));
  Serial.print("-");
  
  // sensor #4
  Serial.print(analogRead(vol3));
  Serial.print("-");

  // sensor #5
  Serial.print(analogRead(vol4));
  Serial.print("-");

  // sensor #6
  Serial.println(analogRead(vol5));
  
  delay(50); // this parameter can be adjusted due to the sensors and real-time analysis complexity
}