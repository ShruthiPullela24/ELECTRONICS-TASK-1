# What it does:
## This project simulates a 1-axis solar tracking system. It uses two light-dependent resistors (LDRs) positioned on the left and right to constantly monitor ambient light levels. The Arduino compares the analog readings from both sensors. If one side is significantly brighter than the other, the Arduino signals a servo motor to rotate toward the brighter light source, stopping when the light levels are balanced.
# Why I chose it: 
## This project allowed me to combine sensor inputs (LDRs) with a mechanical output (Servo). It demonstrates real-world control systems, showing how microcontrollers can interpret comparative data to adjust physical positioning autonomously.
# Components used and their roles:
## Arduino Uno
### Acts as the brain of the project. It reads the voltage levels from the LDRs, processes the comparison logic, and sends the corresponding position signals to the servo motor.
## Servo Motor (Micro Servo)
### Acts as the physical actuator. Connected to digital pin 9, it rotates from 0 to 180 degrees to aim the tracker toward the strongest light source.
## 2x Photoresistors (LDRs)
### The sensors used to detect light intensity on the "left" and "right" sides of the tracker. Connected to analog pins A0 and A1.
## 2x Resistors (10kΩ)
### Used in series with the LDRs to create voltage dividers. This converts the changing resistance of the LDRs into varying voltage levels that the Arduino's analog pins can read
## Breadboard & Jumper Wires
### Used to establish the electrical connections between the Arduino, sensors, and the motor.
# Challanges:
## Initially, if the light levels on both LDRs were very close or fluctuating slightly, the servo would constantly twitch back and forth trying to find the absolute perfect center. So to avoid this, I introduced a tolerance  in the code. By adding + 20 to the comparison (if (leftLight > rightLight + 20)), the servo only moves when there is a clear, significant difference in light, eliminating the back and forth movement.
