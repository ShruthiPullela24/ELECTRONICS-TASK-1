// Pin setup
const int led = 13;
const int btn = 2;

// Time tracking
unsigned long start;
unsigned long time;

void setup() {
  pinMode(led, OUTPUT);
  
  //Using pullup to keep the circuit simple
  pinMode(btn, INPUT_PULLUP);
  
  Serial.begin(9600);
  
  //Randomize the wait times using pin A0
  randomSeed(analogRead(0));
  
  Serial.println("Reaction Time Tester Started!");
  Serial.println("Wait for the LED, then hit the button!");
  Serial.println("-----------------------------------------------------");
}

void loop() {
  digitalWrite(led, LOW);
  
  //Wait between 2 and 6 seconds
  long wait = random(2000, 6000);
  delay(wait);
  
  //Check if button is held down early
  if (digitalRead(btn) == LOW) {
    Serial.println("No cheating! You pressed too early. Resetting...");
    delay(2000);
    return; 
  }

  //LED on, start the clock
  digitalWrite(led, HIGH);
  start = millis();
  
  //Wait here until the button is pressed
  while (digitalRead(btn) == HIGH) {
  }
  
  //Calculate the difference
  time = millis() - start;
  
  digitalWrite(led, LOW);
  
  Serial.print("Reaction Time: ");
  Serial.print(time);
  Serial.println(" ms");
  Serial.println("Get ready for the next test...");
  Serial.println("-----------------------------------------------------");
  
  //3-second break
  delay(3000);
}
