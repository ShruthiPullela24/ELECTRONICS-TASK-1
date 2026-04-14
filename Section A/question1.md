# SECTION A QUESTION 1
## Controlling three LEDs without relying on blocking delay() functions. Instead, it utilizes the hardware's internal millis() timer to continuously monitor the elapsed time for each LED against predefined intervals (500ms, 1000ms, and 1500ms). By maintaining separate state variables and timestamp records for each component, the program achieves seamless multitasking. This non-blocking architecture allows all three LEDs to toggle at their own unique frequencies simultaneously without ever halting the processor's main control loop.


