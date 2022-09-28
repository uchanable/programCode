# 1 "/Users/uchanable_m1/programming/Arduino/0001.ino"
void setup(){
    Serial.begin(115200);
}

void loop(){
    Serial.println("hellasdfo VSCode!!");
    delay(500);
}
# 1 "/Users/uchanable_m1/programming/Arduino/220928_FSR.ino"
int sensor = A7;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int val = analogRead(sensor);
  Serial.println(val);
}
