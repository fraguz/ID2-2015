//
// © Daniele @ Fupete for the course ID2-2015 @ UnirSM
// github.com/fupete
// Made for educational purposes, MIT License, May 2015, San Marino
// 

/*
 * REFERENCES
 * 'Rotating more than one offset circle' 
 * by wintersac2 - Processing Forum, Sept 2014
 * forum.processing.org/two/discussion/7163/rotating-more-than-one-offset-circle
 *
 */



float angle = 0.0;
float offset = 60;
float scalar = 30;
float speed = 0.05;
 
void setup() {
size(820, 820);
smooth();
}
 
void draw() {
  background(200);
float x = offset + cos(angle) * scalar;
float y = offset + sin(angle) * scalar;

noFill();
ellipse( x, y, 40, 40);
angle += speed;

 
}
