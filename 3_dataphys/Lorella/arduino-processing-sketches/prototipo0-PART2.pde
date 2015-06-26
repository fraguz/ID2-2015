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

 void arduino(float media)
 {
 // float mappa=map(volume,0,290,190,255);
 // port.write(byte(mappa));

if(media>10 && media<20)
 port.write('A');
if(media>20 && media<40)
 port.write('B');
 if(media>40 && media<60)
 port.write('C');
if(media>60 && media<80)
 port.write('D');
if(media>80 && media<120)
 port.write('E');
  
 
 }
 // FINALE + IMPOSTAZIONI DELLA COMUNICAZIONE CON ARDUINO
