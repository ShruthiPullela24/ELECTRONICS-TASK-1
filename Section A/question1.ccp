// C++ code
//
const int led1 = 13;
const int led2 = 12;
const int led3 = 11;

int leds1 = LOW;
int leds2 = LOW;
int leds3 = LOW;

unsigned long pmillis1 = 0;
unsigned long pmillis2 = 0;
unsigned long pmillis3 = 0;

const long interval1 = 500;
const long interval2 = 1000;
const long interval3 = 1500;

void setup()
{
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
}

void loop()
{
  unsigned long cmillis = millis();
  if (cmillis-pmillis1 >= interval1)
    {
    pmillis1 = cmillis;
    if(leds1 == LOW)
      {
      leds1 = HIGH;
      }
    else
      {
      leds1 = LOW;
      }
    digitalWrite(led1,leds1);
    }
  if (cmillis-pmillis2 >= interval2)
    {
    pmillis2 = cmillis;
    if(leds2 == LOW)
      {
      leds2 = HIGH;
      }
    else
      {
      leds2 = LOW;
      }
    digitalWrite(led2,leds2);
    }
  if (cmillis-pmillis3 >= interval3)
    {
    pmillis3 = cmillis;
    if(leds3 == LOW)
      {
      leds3 = HIGH;
      }
    else
      {
      leds3 = LOW;
      }
    digitalWrite(led3,leds3);
    }
  
      
}
