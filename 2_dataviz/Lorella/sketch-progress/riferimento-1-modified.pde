//
// © Daniele @ Fupete for the course ID2-2015 @ UnirSM
// github.com/fupete
// Made for educational purposes, MIT License, May 2015, San Marino
// 

/*
 * REFERENCES
 * 'getLineIn' - Minim library
 *
 */

import ddf.minim.* ; // richiamo la libreria

Minim minim; 
AudioInput in ;

int i ; // in print

void setup() {

  size(400, 400) ;

  minim = new Minim(this) ; // oggetto minim
  in = minim.getLineIn(Minim.MONO); // modalità input mono
} // end setup

void draw() {

  println(in.left.get(i)); // stringa dati

    background(200);
  smooth(); // antialiasing
  for (int i = 0; i < in.bufferSize () - 1; i++) { 
    // non ho capito bene in.bufferSize()

    // RECT - commenta ellipse o resta coperto
    noStroke();
    fill(255);
    ellipse(width/2, height/2, in.left.get(i)*500, in.left.get(i)*500);
  } // end for
} // end draw
