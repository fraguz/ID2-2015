##Prime visualizzazioni in Processing

#####SKETCH RIFERIMENTO 1

Il primo sketch di riferimento è [getLineIn](http://code.compartmental.net/minim/minim_method_getlinein.html) 
della libreria [Minim](http://code.compartmental.net/tools/minim/).

Mi serve ad immettere in Processing l'input audio proveniente dal microfono del mio portatile.

L'obiettivo per ora è stato capirne il funzionamento e provare a controllare visualizzazioni minime.
Utile anche per riuscire a vedere il tipo di dati numerici con cui ho a che fare, 
cosa viene rilevato dal mic del mio portatile ed introdotto in Processing.

```
// SKETCH 1

import ddf.minim.*; // indico la libreria

Minim minim; // ?
AudioInput in; // ??
int i; //dichiaro la var da usare in print
void setup() {
  size(400, 400); //come renderizza processing (default sketch P3D, oppure P2D o PDF);

  minim = new Minim(this); //oggetto minim

  // use the getLineIn method of the Minim object to get an AudioInput
  // in = minim.getLineIn(Minim.STEREO); linea originale
  in = minim.getLineIn(Minim.MONO); // modalità input: stereo o mono
} // fine setup

void draw() {
  
  print(" left ");
  print(in.left.get(i)); // input stereo sin
  
  print(" / ");
  
  print(" right ");
  println(in.right.get(i)); // input stereo dx
  //voglio vedere i dati

  // MONO i valori left&right sono uguali
  // due valori per left e due valori per right
  // ma uguali
  // e variano in base al variare dell'intensità del suono
  
  // STEREO i valori left&right sono diversi
  // un valore per left ed un valore per right
  // che variano in base al variare dell'intensità del suono
  // ed alla provenienza
  
  // ma mono&stereo non sono relativi all'output?
  
  // sono valori molto bassi 
  // ecco perc in.left.get(i) va moltiplicato per qualcosa
  // ai fini di una visualizzazione più sensibile

  background(255);
  for (int i = 0; i < in.bufferSize () - 1; i++) { 
    // non ho capito bene in.bufferSize()

    // RECT - commenta ellipse o resta coperto
    noStroke();
    fill(255, 0, 0);
    //rect(200, height/2-50, in.left.get(i)*100, 100); //aumento su width
    //rect(200, height/2-50, in.left.get(i), 100); //devo moltiplicare per qualcosa la variabile
    //rect(width/2-50, height/2, 100, in.left.get(i)*100); //aumento su height
    
    // RECT AI VERTICI (tutto speculare)
    //rect(0, 0, in.left.get(i)*100, 100);
    //rect(400, 0, -in.left.get(i)*100, in.left.get(i)*100);
    //rect(400, 400, in.left.get(i)*100, in.left.get(i)*100);
    //rect(0, 400, in.left.get(i)*100, -in.left.get(i)*100);
    
    // ELLIPSE
    //ellipse(width/2,height/2,50+in.left.get(i)*100,50); //aumento su asseX
    //ellipse(width/2,height/2,50,50+in.left.get(i)*100); //aumento su asseY
    ellipse(width/2, height/2, in.left.get(i)*500, in.left.get(i)*500);
    
  } //fine for
} //fine draw

```

#####SKETCH RIFERIMENTO 2

Il secondo sketch  è il [clock](https://processing.org/examples/clock.html), dagli esempi di Processing.

```
// SKETCH 2

// mi baso sui secondi
// elimino tutto quello che
// riguarda minuti ed ore

int cx, cy; // il centro
float secondsRadius; // variabile angolo rotazione del raggio
// float minutesRadius; // no need
// float hoursRadius; // no need
// float clockDiameter; // serve?

void setup() {
  size(640, 360);
  stroke(255);

  int radius = min(width, height) / 2;  // dichiaro raggio //perc diviso due?
  secondsRadius = radius * 0.72; // inizializzo raggio

  cx = width / 2; // inizializzo centro
  cy = height / 2; // inizializzo centro
} // end setup

void draw() {
  background(0);

  fill(80);
  noStroke();

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; 

  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);

  endShape();
} //end draw

```


#####SKETCH RIFERIMENTO 3

L'[ultimo sketch](http://forum.processing.org/two/discussion/7163/rotating-more-than-one-offset-circle)
rappresenta una linea che ruota attorno ad un punto dato.
Un po' come fosse una lancetta senza temporizzazione.
Mi interessano il mix di variabilità dell'angolo di rotazione, dell'offset e della velocità.

```
float   angle  =   0.00 ; 
float  offset  =  60 ; 
float   scalar  =  50 ; 
// ci aumento le dimensioni della lancetta

float   speed   =  0.1 ; 

void setup  () {
  size   (120, 120) ;  
  // smooth  () ; // servirebbe per ottimizzare il visualizzato
} //end setup

void  draw  () { 
  
  background(255); 
  
  float  x  =  offset + cos (angle) * scalar ; // spostamento x
  float  y  =  offset + sin  (angle) * scalar ; // spostamento y
  
  line  ( width/2, height/2,  x, y); 
  
  angle  +=  speed; // che vol dì?
} //end draw

```

##Desiderata

Fra le visualizzazioni proposte in [Dataviz-1](https://github.com/LoreCame/ID2-2015/blob/master/2_dataviz/LorellaCamellina/dataviz-1.md) 
quella che approfondirei è la #1, modificandone le variabili come di seguito:

- V1 è il tempo (in particolare 360°=60''=1');
- V2 è l'intensità (per R=raggio maggiore e r=raggio minore, avremo che rumore R > rumore r).

L'input sarà ciò che viene rilevato dal microfono del mio portatile.

L'idea è di visualizzare secondo per secondo (o forse con una frequenza più elevata) la quantità di rumore.
Trascorsi i 60', la visualizzazione del minuto appena passato si azzera per lasciare posto a quella del 
minuto entrante. Negli esempi riportati di seguito ho provato a rendere l'idea in bianco e nero 
ma non è escludibile un possibile apporto dato dall'utilizzo dei colori.

![1](http://i.imgur.com/uEaXdCG.jpg?1)

_Esempio 1_


![2](http://i.imgur.com/WXXS3YH.jpg?1)

_Esempio 2_

![3](http://i.imgur.com/rRIahzs.jpg?1)

_Esempio 3_
