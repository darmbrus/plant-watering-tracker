const int buttonPin = 2;

int buttonState = 0;

void setup() {
  Serial.begin(9600);
  pinMode(buttonPin, INPUT);
}

void loop() {
  int randNum = random(300);
  buttonState = digitalRead(buttonPin);
  
  if (buttonState == HIGH) {
    Serial.println(randNum);
    while(buttonState) {
      buttonState = digitalRead(buttonPin);  
    }
  }
  delay(50);
}
