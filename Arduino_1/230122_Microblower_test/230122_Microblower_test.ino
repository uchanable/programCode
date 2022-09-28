int s1 = 8;
int s2 = 9;
int s3 = 10;
int s4 = 11;

void setup() {
  Serial.begin(9600);
  pinMode(s1, OUTPUT);
  pinMode(s2, OUTPUT);
  pinMode(s3, OUTPUT);
  pinMode(s4, OUTPUT);
}

void loop() {
    MicroblowerOFF();
    delay(500);
 //   delay(500);
 //   Microblower1();
 //   delay(200);
 //   Microblower12();
 //   delay(200);
 //   Microblower2();
 //   delay(150);
 //   Microblower23();
 //   delay(200);
 //   Microblower3();
 //   delay(100);
 //   Microblower34();
 //   delay(200);
 //   Microblower4();
 //   delay(50);
    Microblower1();
    delay(10000);
}

void Microblower1(){
    digitalWrite(s1, HIGH);
    digitalWrite(s2, LOW);
    digitalWrite(s3, LOW);
    digitalWrite(s4, LOW);
}
void Microblower2(){
    digitalWrite(s1, LOW);
    digitalWrite(s2, HIGH);
    digitalWrite(s3, LOW);
    digitalWrite(s4, LOW);
}
void Microblower3(){
    digitalWrite(s1, LOW);
    digitalWrite(s2, LOW);
    digitalWrite(s3, HIGH);
    digitalWrite(s4, LOW);
}
void Microblower4(){
    digitalWrite(s1, LOW);
    digitalWrite(s2, LOW);
    digitalWrite(s3, LOW);
    digitalWrite(s4, HIGH);
}
void MicroblowerON(){
    digitalWrite(s1, HIGH);
    digitalWrite(s2, HIGH);
    digitalWrite(s3, HIGH);
    digitalWrite(s4, HIGH);
}
void MicroblowerOFF(){
    digitalWrite(s1, LOW);
    digitalWrite(s2, LOW);
    digitalWrite(s3, LOW);
    digitalWrite(s4, LOW);
}

void Microblower12(){
    digitalWrite(s1, HIGH);
    digitalWrite(s2, HIGH);
    digitalWrite(s3, LOW);
    digitalWrite(s4, LOW);
}

void Microblower23(){
    digitalWrite(s1, LOW);
    digitalWrite(s2, HIGH);
    digitalWrite(s3, HIGH);
    digitalWrite(s4, LOW);
}

void Microblower34(){
    digitalWrite(s1, LOW);
    digitalWrite(s2, LOW);
    digitalWrite(s3, HIGH);
    digitalWrite(s4, HIGH);
}