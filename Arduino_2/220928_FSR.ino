int sensor = A7;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int val = analogRead(sensor);
  Serial.println(val);
}