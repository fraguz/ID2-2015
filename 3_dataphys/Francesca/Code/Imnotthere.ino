#include <Servo.h>

Servo myservo;

void setup()
{
  myservo.attach(8);
  
  
}

void loop() {

  myservo.write(180);  // 0 max velocity in one direction while 180 in the other, 90 no movement
  delay(100);


}
