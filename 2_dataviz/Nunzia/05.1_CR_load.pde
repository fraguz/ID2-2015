import ddf.minim.*;
import ddf.minim.ugens.*;

int i = 10;
int punto; 
int x = 10; //posizione orizzontale 
int y = 50; //posizione verticale
int timer=0;

int asp = 0;

int max=1000;

int[] giallo = new int[max];
int[] azzurro = new int[max];
int[] rosso = new int[max];

color colorGiallo = color(249, 178, 51);
color colorAzzurro = color(54, 169, 225);
color colorRosso = color(151, 25, 20);

int[] timer1 = new int[max]; //timer 
int[] timer2 = new int[max]; //timer 
int[] timer3 = new int[max]; //timer 


int iyello=0;
int iblue=0;
int ired=0;
int stop=0;


Minim minim;
AudioOutput out;

void setup() {
  size(1850, 500);

  minim = new Minim( this );
  out = minim.getLineOut( Minim.MONO, 2048 );




  for (int i=0; i<max; i++) {

    giallo[i]=-100;
    azzurro[i]=-100;
    rosso[i]=-100;
  }


  String lines[] = loadStrings("result.txt");
  // byte b[] = loadBytes("numbers.dat"); 

  for (int i =0; i<lines.length; i++) {
    String[] set = split(lines[i], "_");
    //println(set[0]+"   "+set[1]);

    if (set[1].equals("veloce")) {
      println("VELOCE");


      rosso[ired]=int(set[0]);
      ired++;
    }
    if (set[1].equals("normale")) {

      azzurro[iblue]=int(set[0]);
      iblue++;
    }
    if (set[1].equals("lento")) {
      giallo[iyello]=int(set[0]);
      iyello++;
    }
  }
}

void draw () {
  background(245);



  for (int i =0; i<ired; i++) {
    if (rosso[i]==x) {
  out.playNote( 0.1, 0.3, new ToneInstrument( random(30, 60), 3 ) ); //frequenze

    }
  }
  
  for (int i =0; i<iblue; i++) {
    if (azzurro[i]==x) {
  out.playNote( 0.1, 0.3, new ToneInstrument( random(60, 100),3 ) ); //frequenze 

    }
  }

  for (int i =0; i<iyello; i++) {
    if (giallo[i]==x) {
  out.playNote( 0.1, 0.3, new ToneInstrument( random(100, 150), 3 ) ); //frequenze

    }
  }
  
  
    circle(giallo, colorGiallo, 70, timer1, iyello); //grandezza cerchi +timer
    circle(azzurro, colorAzzurro, 50, timer2, iblue);
    circle(rosso, colorRosso, 100, timer3, ired);

    fill(0);
    stroke(0);
    ellipse(x, 233, 10, 10); //costruzione ellisse 

    x = x+1; //movimento ellisse 

    rect(30, 225, 3, 15); //rettangoli per divisione tempo 
    rect(470, 225, 3, 15); 
    rect(910, 225, 3, 15);
    rect(1350, 225, 3, 15);
    rect(1807, 225, 3, 15);

    stroke(0);

    for (int x = 30; x <= 1810; x += 3) { //costruzione fila di linee
      line (x, 225, x, 240);
      fill(87, 87, 87);
    }
  }   

  void circle(int[] array, color col, int dim, int[] timer, int set) { //elenco di dati:circle
    //colore, dimensione, timer
    for (int j=0; j<set; j++) { //lunghezza
      if (x>array[j]) {
        if (timer[j]<dim)
          timer[j]++; //velocitÃ  timer 
        delay(1); //ritardo, diminuzione velocitÃ  della pallina 
        noStroke(); 
        fill(col, 150-timer[j]); //opacitÃ  ed evoluzione: cerchi 
        ellipse(array[j], 233, timer[j], timer[j]);
        for (int i=0; i<dim; i+=10) {
          if (i<timer[j])
            ellipse(array[j], 233, i, i);
        }
        fill(0);
      }
    }
  } 




  class ToneInstrument implements Instrument
  {

    Oscil sineOsc;
    ADSR  adsr;

    ToneInstrument( float frequency, float amplitude )
    {    
      sineOsc = new Oscil( frequency, amplitude, Waves.TRIANGLE );
      adsr = new ADSR( 0.5, 0.01, 0.05, 0.5, 0.5 );
      sineOsc.patch( adsr );
    }

    void noteOn( float dur )
    {
      adsr.noteOn();
      adsr.patch( out );
    }
    void noteOff()
    {
      adsr.unpatchAfterRelease( out );
      adsr.noteOff();
    }
  }
