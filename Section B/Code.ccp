#include <Servo.h>

Servo trackerServo;

int servoAngle = 90; 

void setup() {
  //Tell the Arduino the servo is on pin 9
  trackerServo.attach(9);
  trackerServo.write(servoAngle);
}

void loop() {
  //Read the light levels from both sensors
  int leftLight = analogRead(A0);
  int rightLight = analogRead(A1);

  //Compare the light levels and move the servo
  if (leftLight > rightLight + 20) { 
    //Left side is brighter, move left
    servoAngle = servoAngle + 2; 
  } 
  else if (rightLight > leftLight + 20) {
    //Right side is brighter, move right
    servoAngle = servoAngle - 2; 
  }

  //Set limits so the servo doesn't try to spin past its physical stopping points
  if (servoAngle > 180) { 
    servoAngle = 180; 
  }
  if (servoAngle < 0) { 
    servoAngle = 0; 
  }

  //Move the servo to the new angle
  trackerServo.write(servoAngle);
  
  //A small delay to make the movement smooth
  delay(50); 
}
