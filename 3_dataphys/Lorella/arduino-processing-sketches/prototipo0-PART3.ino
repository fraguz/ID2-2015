/*
 Physical Pixel
 
 Using the Arduino board to receive data from pc microphone and Processing.
 In this case, the Arduino boards turns on an fan. Instructions about fan power 
 are coming from noise level around your pc.
 The circuit:
 * fan connected from PWM pin 9 to ground
 
 created 2006
 by David A. Mellis
 modified 30 Aug 2011
 by Tom Igoe and Scott Fitzgerald
 
 This example code is in the public domain.
 
 http://www.arduino.cc/en/Tutorial/PhysicalPixel
 */

const int ledPin2 = 9; // pin ventola settato su PWM
int incomingByte; // variabile in input da Processign
void(* Riavvia)(void) = 0;

void setup() {

  Serial.begin(9600);

} // end setup

void loop() {

  if (Serial.available() > 0) {

    incomingByte = Serial.read();

    if (incomingByte == 'A') {
      analogWrite(ledPin2, 50);
    } // RANGE A

    if (incomingByte == 'B') {
      analogWrite(ledPin2, 100);
    } // RANGE B

    if (incomingByte == 'C') {
      analogWrite(ledPin2, 150);
    } // RANGE C

    if (incomingByte == 'D') {
      analogWrite(ledPin2, 200);
    } // RANGE D

    if (incomingByte == 'e') {
      analogWrite(ledPin2, 255);
    } // RANGE E

  } // end if a monte

} // end loop

//Dichiarazione di funzione che punta all'indirizzo zero

/* Processing code for this example
 
 // mouseover serial
 
 // Demonstrates how to send data to the Arduino I/O board, in order to
 // turn ON a light if the mouse is over a square and turn it off
 // if the mouse is not.
 
 // created 2003-4
 // based on examples by Casey Reas and Hernando Barragan
 // modified 30 Aug 2011
 // by Tom Igoe
 // This example code is in the public domain.
 
 import processing.serial.*;
 
 float boxX;
 float boxY;
 int boxSize = 20;
 boolean mouseOverBox = false;
 
 Serial port;
 
 void setup()  {
 size(200, 200);
 boxX = width/2.0;
 boxY = height/2.0;
 rectMode(RADIUS);
 
 // List all the available serial ports in the output pane.
 // You will need to choose the port that the Arduino board is
 // connected to from this list. The first port in the list is
 // port #0 and the third port in the list is port #2.
 println(Serial.list());
 
 // Open the port that the Arduino board is connected to (in this case #0)
 // Make sure to open the port at the same speed Arduino is using (9600bps)
 port = new Serial(this, Serial.list()[0], 9600);
 
 }
 
 void draw()
 {
 background(0);
 
 // Test if the cursor is over the box
 if (mouseX > boxX-boxSize && mouseX < boxX+boxSize &&
 mouseY > boxY-boxSize && mouseY < boxY+boxSize) {
 mouseOverBox = true;
 // draw a line around the box and change its color:
 stroke(255);
 fill(153);
 // send an 'H' to indicate mouse is over square:
 port.write('H');
 }
 else {
 // return the box to it's inactive state:
 stroke(153);
 fill(153);
 // send an 'L' to turn the LED off:
 port.write('L');
 mouseOverBox = false;
 }
 
 // Draw the box
 rect(boxX, boxY, boxSize, boxSize);
 }
 
 
 */
