//
// NOISE VIBRANCY VISUALIZER
// © Daniele @ Fupete for the course ID2-2015 @ UnirSM
// github.com/fupete
// Made for educational purposes, MIT License, May 2015, San Marino
// 

/*
 * VISUALIZE NOISE AROUND YOUR PC
 * Actual noise vibrancy visualization.
 * Radius length stands for intensity.
 *
 * REFERENCES
 * 'getLineIn' - Minim library
 * 'Rotating more than one offset circle' 
 * by wintersac2 - Processing Forum, Sept 2014
 * forum.processing.org/two/discussion/7163/rotating-more-than-one-offset-circle
 *
 */


int size = 600 ;
float angle = 0.00 ; 
float vibrancy ; // dimensionamento raggio
float speed = 0.1 ; // velocità

import ddf.minim.* ; // richiamo la libreria
Minim minim ;
AudioInput in ;


void setup () {

  size (size, size) ; 
  background(255) ;

  minim = new Minim (this) ; // oggetto minim
  in = minim.getLineIn (Minim.MONO) ; // input mono
  fill(255,20) ; // opacità
  smooth() ; // antialiasing
  frameRate(60) ; // frame al secondo
} //end setup

void  draw () { 

  vibrancy = map ((in.left.get(0)*5), 0.01, 5, 0, 270) ; 
  // scalar = in.left.get(0) ;
  
  /*
  raggio = in.left.get(0) ;
   I valori audio in input 
   sono troppo piccoli per riuscire ad esser visualizzati.
   Moltiplicando ciò che rileva il microfono per un valore empirico (5)
   e mappando quello stesso valore risultante
   riesco ad ottimizzare la visualizzazione.
   L'intento è mantenere il raggio massimo 
   nella finestra di visualizzazione (size 600)
   creando la giusta combinazione di valori nella mappatura.
   */

  if (frameCount % 60 == 0) { // se #frame dall'avvio/frameRate=0 allora

    background(255,20) ; // rigenera output visivo (ogni sec)
    println(in.left.get(0)) ; // e stampa input numerico (ogni sec)
  } //end if
  
  strokeWeight(0); // per evitar d'usare sul rect la strokeWeight successiva
  rect (0, 0, size, size) ; 

  float x = size/2 + cos (angle) * vibrancy ; // variazione x
  float y = size/2 + sin  (angle) * vibrancy ; // variazione y
  float s = map (vibrancy, 0.01, 270, 0.2, 6); // variazione strokeWeight
  s = abs(s); 
  /* 
   in float s
   faccio in modo d'aver sempre un valore assoluto 
   per evitare errori di software
  */
  strokeWeight(s); 
  strokeCap(ROUND); 
  strokeJoin(ROUND);

  line (size/2, size/2, x, y); 

  angle  +=  speed; // incremento dell'angolo
  // equivalente angle = angle + speed ;
} //end draw

/*

Giuseppe mi ha fatto giustamente notare che l'input in.left.get(0) fornisce valori di frequenze 
e non quelli del volume a cui io puntavo concettualmente. 
Corretto questo, sto aggiornando il codice per arrivare alla visualizzazione proposta in Dataviz-4. 
L'aggiornamento sarà il file dataviz-5.pde.

*/
