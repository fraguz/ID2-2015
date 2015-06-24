//
// NOISE VIBRANCY VISUALIZER
// © Daniele @ Fupete for the course ID2-2015 @ UnirSM
// github.com/fupete
// Made for educational purposes, MIT License, May 2015, San Marino
// 

/*
 * PART 2 - SEND DATA TO ARDUINO
 * Settings to communicate with Arduino.
 * Data you are sending is the float "volume"
 *
 * REFERENCES
 * 'Physical Pixel' - Arduino Tutorials
 * arduino.cc/en/Tutorial/PhysicalPixel
 * by David A. Mellis
 * modified 30 Aug 2011
 * by Tom Igoe and Scott Fitzgerald
 *
 * thanks to Giuseppe D'Ambrosio
 *
 */
 
 import processing.serial.*;

 float boxX;
 float boxY;
 int boxSize = 20;
 boolean mouseOverBox = false;

 Serial port;

 void arduino(float volume)
 {

if(volume>0 && volume<60)
 port.write('A');
if(volume>60 && volume<120)
 port.write('B');
 if(volume>120 && volume<180)
 port.write('C');
if(volume>180 && volume<240)
 port.write('D');
if(volume>240 && volume<290)
 port.write('E'); 
 
 } // end if
 
 // FINALE + IMPOSTAZIONI DELLA COMUNICAZIONE CON ARDUINO
