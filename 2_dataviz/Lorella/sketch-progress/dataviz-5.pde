//
// NOISE VIBRANCY VISUALIZER
// © Daniele @ Fupete for the course ID2-2015 @ UnirSM
// github.com/fupete
// Made for educational purposes, MIT License, May 2015, San Marino
// 

/*
 * VISUALIZE NOISE AROUND YOUR PC
 * Noise vibrancy visualizer.
 * Each second you see a radius.
 * Each radius is a volume detection done with your pc microphone.
 * Each radius length stands for the intensity of that second's volume.
 * In the end you have a visualization of one minute.
 * At the end of a minute it all starts again.
 *
 * REFERENCES
 * 'getLineIn' - Minim library
 * 'Rotating more than one offset circle' 
 * by wintersac2 - Processing Forum, Sept 2014
 * forum.processing.org/two/discussion/7163/rotating-more-than-one-offset-circle
 * Special thanks to Giuseppe D'Ambrosio
 *
 */

int size = 600 ; // per la finestra di visualizzazione 
float angle = radians(-84) ; // primo raggio disegnato ad ogni run
/* 
 Zero per processing e la sua impostazione cartesiana significa 90° convenzionali (3 o'clock).
 Io voglio che la visualizzazione inizi a 0° (12 o'clock).
 Ecco perché il valore negativo. 
 */
float VOL ; // per dimensionare il raggio 
float offsetraggio = radians(6) ; // "velocità"
int inc = 0 ; // variabile di incremento
int tempo; // mi serve per rigenerare la visualizzazione ogni 60"

import ddf.minim.* ; // richiamo la libreria
Minim minim ; 
AudioInput in ;

void setup() {

  size(600, 600);
  background(255);
  smooth() ; // antialiasing
  minim = new Minim (this) ; // oggetto minim
  in = minim.getLineIn (Minim.MONO) ;
  frameRate(60) ; // frame al secondo
} // end set up

void draw() {
  inc++; // variabile di incremento

  // COMPORTAMENTO 
  if (inc==60) { 

    print(" VOLUME = ");
    println(in.right.level()); // stampo i valori del VOL

    float VOL = in.right.level()*500; // INPUT VALORE VOLUME
    /*
     raggio = (in.right.level() ;
     I valori audio in input sono troppo piccoli per riuscire ad esser visualizzati.
     Moltiplicando ciò che rileva il microfono per un valore empirico (500) e mappando sulla finestra di visualizzazione 
     quello stesso valore risultante, riesco ad ottimizzare la visualizzazione.
     L'intento è mantenere il raggio massimo nella finestra di visualizzazione (size 600) 
     creando la giusta combinazione di valori nella mappatura seguente (*).
     */
    float x = size/2 + cos (angle) * VOL ; // variazione x
    float y = size/2 + sin  (angle) * VOL ; // variazione y
    float s = map (VOL, 0.01, 270, 0.2, 2); // variazione spessore in base all'intensità
    s = abs(s); 
    strokeWeight(s);
    /* 
     in float s
     faccio in modo d'aver sempre un valore assoluto 
     per evitare errori di software
     */
    strokeCap(ROUND);
    strokeJoin(ROUND);

    // INCREMENTO
    if (angle<radians(360)) {
      VOL= map (VOL, 0.00, 0.2, 0.1, 270) ; // adatto i valori del volume alla finestra di visualizzazione (*)
      line (size/2, size/2, x, y); 
      angle += offsetraggio;
      inc=0;
      /* 
       se l'angolo è minore di un angolo giro
       allora disegna la linea in questo modo
       */

      // AGGIORNAMENTO VISUALIZZAZIONE OGNI 60"
      //if (millis()>tempo+60000) {
      // tempo=millis();
      //  background(255);
      /* 
       se sono passati 60 millis dal lancio dello sketch
       allora cancella e riparti
       */
    } // end if rigenera
    if (angle==radians(360)) {
      background(255);
      angle=radians(0);
    } // end if millis
  } // end if incremento
} // end if comportamento

