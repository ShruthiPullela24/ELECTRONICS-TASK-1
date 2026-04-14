// Pins
const byte pot = A0, blinker = 2, red = 11, green = 9, blue = 10;


unsigned long lastBlink = 0;
bool lightOn = false;

void setup() {
  pinMode(blinker, OUTPUT);
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
}

void loop() {
  int val = analogRead(pot);

 //1. Color Control (Common Anode: 0 = ON, 255 = OFF)
  int r = 255, g = 255, b = 255; // Start with all colors completely OFF
  

  if (val < 342) {
    r = map(val, 0, 341, 0, 255);   // Fade Red out
    g = 255 - r;                    // Fade Green in
  } else if (val < 683) {
    g = map(val, 342, 682, 0, 255); // Fade Green out
    b = 255 - g;                    // Fade Blue in
  } else {
    b = map(val, 683, 1023, 0, 255);// Fade Blue out
    r = 255 - b;                    // Fade Red in
  }

  analogWrite(red, r); 
  analogWrite(green, g); 
  analogWrite(blue, b);

 //2. Blinker Control
  int speed = map(val, 0, 1023, 50, 1000);
  
  if (millis() - lastBlink >= speed) {
    lastBlink = millis();
    lightOn = !lightOn; // The "!" flips the state instantly (True to False, etc.)
    digitalWrite(blinker, lightOn);
  }
}
