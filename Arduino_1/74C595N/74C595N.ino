// 클럭 입력이 활성화되면, 입력을 받아 저장하고, 클럭 입력이 비활성화되면 출력 측으로 전달합니다.
// 출력은 클록이 다시 활성화될 때까지 그 값을 유지할 것이다.
int latch = 2;
 
// 클럭펄스를 발생시켜 데이터 값이 레지스터에 저장되도록 합니다.
int clock = 3;
 
// 이 데이터 핀을 통해 시프트 레지스터에 원하는 동작을 수행하게 합니다.
int data = 4;
 
// 실행시 가장 먼저 호출되는 함수이며, 최초 1회만 실행됩니다.
// 변수를 선언하거나 초기화를 위한 코드를 포함합니다.
void setup() {
  // latch, clock, data부분이 연결된 핀을 OUTPUT으로 설정합니다.
  pinMode(latch, OUTPUT);
  pinMode(clock, OUTPUT);
  pinMode(data, OUTPUT);
  Serial.begin(9600);
}
 
// setup() 함수가 호출된 이후, loop() 함수가 호출되며,
// 블록 안의 코드를 무한히 반복 실행됩니다.
void loop() {
  //8개의 LED를 한 개씩 켜고 끕니다.
  for (int i = 1 ; i < 5 ; i++) {
    // latch의 비활성화하여 데이터를 입력받도록 설정합니다.
    digitalWrite(latch, LOW);
    // 데이터로 입력된 값을 클럭 펄스로 동기화하여 시프트 레지스터에 저장합니다.
    shiftOut(data, clock, MSBFIRST, 1 << i);
    // latch를 활성화하여 저장된 입력된 데이터를 출력핀으로 전달합니다.
    digitalWrite(latch, HIGH);
    // 1초간 대기합니다.
    delay(1000);
  }
}