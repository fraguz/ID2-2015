// -
// G_Spreadsheet_Data 0.1 [JSON / Public url]
// © Daniele @ Fupete for the course ID2 @ UnirSM  
// github.com/fupete — github.com/Fupete/ID2-2015
// Educational purpose, MIT License, march 2015, San Marino
// —
// Carica ed estrapola dati da un documento CSV del server universitario
// I dati vengono raggruppati in Array dove le colonne sono i secondi 
// e le righe le applicazioni richiamate dai client in quel secondo  
// Il file rappresenta visivamente le categorie richiamate o meno nel tempo che passa
// Ogni riga della rappresentazione è una categoria di applicazione sociale all'interno di internet

// —

//GLOBAL=============================================================================================

//slider temporale
import controlP5.*;
ControlP5 cp5;
int timer = 100;
boolean interfaccia = false;

//stringhe per leggere il file CSV e organizzare i dati
String D_title, B_title;
StringList D_values = new StringList(); // RIGHE DELLE APPLICAZIONI DEL SERVER
StringList B_values = new StringList(); // COLONNA TEMPORALE
String titolo[]; //titoli orario [title]
String griglia[][]; // valori cateogrie  [column][row]

//nomi categorie da rappresentare
String[] nomi = { 
  "facebook", "twitter", "instagram", "google+", "linkedin", "pinterest", "tumblr", "whatsapp", "skype", "facetime", "dropbox", "wetransfer", "bittorrent", "icloud", "outlook", "gmail", "spotify", "itunes", "vimeo", "youtube", " "
};

//nomi reali delle applicazioni per creare le cellette 
//in base alla presenza o meno di questi nomi nei secondi
String[] app = { 
  "facebook-base", "twitter-base", "instagram", "google-plus-base", "linkedin-base", "pinterest-base", "tumblr-base", "whatsapp-base", "skype-probe", "facetime", "dropbox", "wetransfer", "bittorrent", "icloud-base", "outlook-web-online", "gmail-base", "spotify", "itunes-base", "vimeo", "youtube-base"
};
int ynomi=0;

int tempo=0;
int dato=0;
int datoDopo=1;
boolean parola=false;
int leggi=0;

int title=0;
int column=0;
int row=0;

int orario=0;
int categoria=0;
int lettura=0;
boolean vero=true;
int social=0;

int move=0;
boolean minuto=false;

//Array per posizionare le cellette
Cella[][] cell= new Cella[1555][20];
ArrayList linea;
int min=0;

//Collegamento con <<<<<ARDUINO>>>>>
import processing.serial.*;
Serial port;
boolean messaggio = false;




//SETUP==============================================================================================
void setup() {
  //1440px / 900px size
  size(displayWidth, displayHeight);
  background(100);

  //creazione slider temporale
  cp5 = new ControlP5(this);
  cp5.addSlider("timer") //nome slider
      .setPosition(520, 800) //posizione slider
      .setWidth(400) //lunghezza slider
        .setRange(100, 1000) //RANGE TEMPORALE
          .setValue(1000) //range di partenza
            .setNumberOfTickMarks(5) //numero di spostamenti possibili
              .setSliderMode(Slider.FLEXIBLE) // se usi Slider.FIX o Slider.FLEXIBLE cambia l'indicatore
                ;

  //creazione pulsante interfaccia a scomparsa
  cp5.addToggle("interfaccia")
    .setPosition(700, 750) //posizione
      .setSize(40, 20) //grandezza
        ;

  // Carico e leggo i dati del server 
  String url = "data.json"; //nome del file
  load_G_Spreadsheet(url);

  //creo nuova griglia e organizzo i dati
  titolo= new String[1555]; // Secondi
  griglia= new String[1555][150]; // Applicazioni in un secondo  [column][row]

    //inserisco valori nella mia nuova griglia
  titolo[title] = B_values.get(dato);
  griglia[column][row] = D_values.get(dato);

  //leggo il file di google dartendo dai valori "1"
  for (int foglio=0; foglio<B_values.size ()-1; foglio++) {

    //confronto se la riga successiva è uguale alla precedente sulla colonna "B"
    if (B_values.get(datoDopo).equals(B_values.get(dato))) {

      //analizzo le parole uguali della colonna "D"
      for (int analisi=datoDopo; analisi>dato-leggi; analisi-- ) {

        //conftonto se le parole della lista "D" contenute in un secondo
        if (D_values.get(datoDopo).equals(D_values.get(analisi-1))) {
          parola=true;
        }
      }//chiudo il for della lista "D"

      if (parola==false) { 
        row++;
        griglia[column][row]= D_values.get(datoDopo);
      } else { 
        parola=false;
      }
      leggi++;
    } //chiudo if della colonna "B"
    else if ( B_values.get(datoDopo) != B_values.get(dato) ) {

      //cambio colonna dei titoli
      title++;
      titolo[title] = B_values.get(datoDopo);
      //cambio colonna e inizio a riempire le righe dei nuovi valori

      column++;
      row=0;
      griglia[column][row]= D_values.get(datoDopo);


      if (parola==true) {
        parola=false;
      }
      leggi=0;
    }//chiudo else if riferito alla colonna "B"

    //aumento valori lista
    dato++;
    datoDopo++;
  }//chiudo il for "foglio"

  //*********ARDUINO**************************************************************

  // List all the available serial ports in the output pane.
  // You will need to choose the port that the Arduino board is
  // connected to from this list. The first port in the list is
  // port #0 and the third port in the list is port #2.
  println(Serial.list());

  // Open the port that the Arduino board is connected to (in this case #0)
  // Make sure to open the port at the same speed Arduino is using (9600bps)
  port = new Serial(this, Serial.list()[2], 9600);

  //******************************************************************************
}//chiudo il VOID SETUP
//SETUP=============================================================================================




//DRAW==============================================================================================
void draw() {

  // contatore di azioni
  if (millis() > tempo+timer) {
    tempo = millis(); 

    background(0);

    // parti grafiche interfaccia colonna rossa e triangoli rossi
    if (interfaccia==false) {
      pushStyle();
      stroke(255);
      fill(255, 0, 0);
      rect(1240, 180, 20, 540);
      popStyle();
    } else {
      pushStyle();
      noStroke();
      fill(255, 0, 0);
      triangle(1240, 240, 1260, 240, 1250, 250);
      triangle(1240, 660, 1260, 660, 1250, 650);
      popStyle();
    }

    //calcolo orario in base alle colonne
    if (orario<column) {

      for ( vero=true; vero==true; lettura++) {

        //leggo se nella colonna finiscono i dati
        if (griglia[orario][lettura]!=null) {

          if (interfaccia==false) {
            //trovo le varie categorie in quel determinato secondo
            pushMatrix();
            rotate(-HALF_PI);
            pushStyle();
            textSize(10);
            textAlign(LEFT);
            text (griglia[orario][categoria], -150, 400+10*categoria);
            popStyle();
            popMatrix();
          }

          if (griglia[orario][categoria].equals("whatsapp-base")) { 
            messaggio=true;
          }

          //creo quadrati colorati in base ai nomi delle categorie
          for (int m=0; m<=19; m++) {
            if (griglia[orario][categoria].equals(app[m])) {               
              social=m;                                                    
              cell[orario][m]= new Cella(0, m*20+250, social);                
              social=20;
            }
          } //chiudo for di comparazione stringa json con il nome dell'applicazione

          categoria++;
        } //chiudo if del null

        else {
          vero=false;
        }
      }//chiudo ciclo for lettura righe per ogni colonna


      //_________________________________________________________________________________
      //riempio le caselle lasciate vuote dal for dei quadrati colorati
      for (int n=0; n<=19; n++) {
        if (cell[orario][n]==null) {
          cell[orario][n]= new Cella(0, n*20+250, social);
        }
      }


      //_________________________________________________________________________________
      //creo la visibitlità dell'orario e delle celle dopo un minuto
      if (orario>=59) {

        for (int g=59; g>=0; g--) {

          if (interfaccia==false) {
            pushMatrix();
            rotate(-HALF_PI);
            textSize(10);
            text(titolo[(orario-g)], -240, g*-20+1254); 
            popMatrix();
          }

          for (int y=0; y<=19; y++) {
            cell[(orario-g)][y].sposto();
            cell[(orario-g)][y].disegna();
          }
        }
      }//chiudo if (orario>60)

      else {

        for (int f=orario; f>=0; f--) { 
          if (interfaccia==false) {
            pushMatrix();
            rotate(-HALF_PI);
            textSize(10);
            text(titolo[(orario-f)], -240, f*-20+1254); 
            popMatrix();
          }

          for (int y=0; y<=19; y++) {
            cell[(orario-f)][y].sposto();
            cell[(orario-f)][y].disegna();
          }
        }
      }// chiudo else
      //_________________________________________________________________________________

      // leggo l'inizio di un minuto
      if ((titolo[orario].substring(6, 8)).equals("00")) {
        minuto=true;
        move=0;
      }

      // creo la linea dei minuti
      if (minuto==true) {
        if (interfaccia==false) {
          pushStyle();
          strokeWeight(1);
          stroke(255, 0, 0);
          line(move*-20+1240, 250, move*-20+1240, 720);
          noStroke();
          fill(0);
          rect(move*-20+1230, 670, 18, 40);
          pushMatrix();
          rotate(-HALF_PI);
          fill(255);
          textSize(12);
          text(titolo[(orario-move)].substring(0, 5), -709, move*-20+1244); 
          popMatrix();
          popStyle();
        } 

        /*
        else {
         pushStyle();
         fill(255);
         triangle(move*-20+1235, 655, move*-20+1245, 655, move*-20+1240, 650);
         strokeWeight(1);
         line(move*-20+1240, 250, move*-20+1240, 650);
         popStyle();
         }
         */
      }

      move++;


      //******************************************************
      //MESSAGGIO PER ARDUINO DI FACEBOOK
      if (messaggio==true) {
        port.write('H');
      } else {
        port.write('L');
      }
      //******************************************************

      //metto a zero le righe e salto nella colonna successiva
      lettura=0;
      categoria=0;
      orario++;
      vero=true;
      social=20;

      messaggio=false;
    }//chiudo ciclo if delle colonne


      //interfaccia aggiuntiva

    if (interfaccia==false) {

      // parti interfaccia visiva
      noFill();
      stroke(255);
      strokeWeight(2);
      rect(0, 0, width-2, height-50);
      rect(0, 180, 50, 540);
      rect(1270, 180, 170, 540);
      strokeWeight(1);

      // creo nomi e linee divisorie delle categorie
      for (int y=0; y<=400; y+=20) {
        line(60, 250+y, 1260, 250+y);
        line(1270, 250+y, 1440, 250+y);
        fill(255);
        text (nomi[(ynomi)], 1290, 265+y);
        ynomi++;
      }
      ynomi=0;

      // creo il titolo dell'opera
      pushStyle();
      textSize(12);
      fill(255);
      text ("METADATA JUICE [VERSIONE 1.1.3]", 20, 70);
      text ("<c> Copyright MIT license 2015+ Unirsm", 20, 84);
      text("OS:\\User\\Program_File\\Document\\Metadajuice.pde", 20, 112);
      text("Processing . . .", 20, 140);
      popStyle();

      //creo le linee di divisione del tempo 
      pushStyle();
      stroke(255);
      noFill();
      for (int x=0; x<1200; x+=20) {
        line(x+60, 240, x+60, 250);
        line(x+60, 650, x+60, 660);
      }
      for (int y=0; y<=400; y+=20) {
        line(60, 250+y, 1260, 250+y);
        line(1270, 250+y, 1440, 250+y);
      }
      strokeWeight(2);
      rect(60, 180, 1200, 540);
      popStyle();
    }//chiudo if interfaccia
  }//chiudo if del contatore "millis"
}
//DRAW==============================================================================================





//VOID==============================================================================================
//mi collego al documento CSV esterno del server
void load_G_Spreadsheet(String url) {

  JSONObject G_Spreadsheet_data = null;

  try 
  { 
    G_Spreadsheet_data = loadJSONObject(url);
    println("loading...");
  } 
  catch(Exception el) 
  { 
    println("Error loading JSON"); 
    exit();
  }

  if (G_Spreadsheet_data == null) 
  { 
    println("No data"); 
    exit();
  } else 
    println("start parsing");
  parse_G_Spreadsheet_JSON(G_Spreadsheet_data); // < this start the magic
} 



//VOID==============================================================================================
//estrapolo i dati dal documento CSV esterno del server
void parse_G_Spreadsheet_JSON(JSONObject jdata) {

  JSONObject feed = jdata.getJSONObject("feed");
  JSONArray entries = feed.getJSONArray("entry");

  for (int i = 0; i < entries.size (); i++) {

    JSONObject entry = entries.getJSONObject(i);
    JSONObject entry_title = entry.getJSONObject("title");
    JSONObject entry_value = entry.getJSONObject("content");

    // cell content index
    String index = entry_title.getString("$t");
    char current_column = index.charAt(0); // < 'empiric' but works :)

    // cell content value
    String value = entry_value.getString("$t");

    // fill the right title/List values <<<< modify to your needs! <<<<
    if (index.equals("B1") == true) { 
      D_title = value;
    } else
      if (index.equals("A1") == true) { 
      B_title = value;
    } else 
      if (current_column == 'B') { 
      D_values.append((value));
    } else
      if (current_column == 'A') { 
      B_values.append(value);
    }
  }
} 
//VOID==============================================================================================



//CLASS=============================================================================================

//questa classe serve per creare le celle colorate
//in base ai dati derivanti dal server
class Cella {
  int stato;
  float x;
  float y;

  Cella(int xpos, int ypos, int s) {
    x = xpos;
    y = ypos;
    stato = s;
  }

  void disegna() {

    //quadrato blu
    if (stato==0 || stato==1 || stato==2 || stato==3 || stato==4 || stato==5 || stato==6) {   
      pushStyle();
      noStroke();
      fill(0, 0, 255);
      rect(1260+x, y, 20, 20);
      popStyle();
    } 

    //quadrato ciano
    else if (stato==7 || stato==8 || stato==9) {
      pushStyle();
      noStroke();
      fill(0, 255, 255);
      rect(1260+x, y, 20, 20);
      popStyle();
    } 

    //quadrato verde
    else if (stato==10 || stato==11 || stato==12 || stato==13) {
      pushStyle();
      noStroke();
      fill(0, 255, 0);
      rect(1260+x, y, 20, 20);
      popStyle();
    } 

    //quadrato giallo
    else if (stato==14 || stato==15) {
      pushStyle();
      noStroke();
      fill(255, 255, 0);
      rect(1260+x, y, 20, 20);
      popStyle();
    } 

    //quadrato viola
    else if (stato==16 || stato==17 || stato==18 || stato==19) {
      pushStyle();
      noStroke();
      fill(255, 0, 255);
      rect(1260+x, y, 20, 20);
      popStyle();
    } 

    //quadrato nero
    else if (stato==20) {
      pushStyle();
      noStroke();
      fill(0, 0);
      rect(1260+x, y, 20, 20);
      popStyle();
    }
  } //chiudo void disegna

  void sposto() {
    x -= 20;
  }
} //chiudo classe
