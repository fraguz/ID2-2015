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
// In questo caso una sola categoria serve per comunicare i dati con Arduino in modo da passare no corrente ai pin
// QUESTO FILE SERVE PER COMUNICARE CON I DATI DEL FILE "DATAPHYS ARDUINO" 
// https://github.com/arraboy/ID2-2015/blob/master/3_dataphys/Gian/code/Dataphys_Arduino.ino

// —

String D_title, B_title; // < holders for column titles, first row, ex. title will be the content from A1, B1, ...
StringList D_values = new StringList(); // < column A, integers, ages
StringList B_values = new StringList(); // < column B, strings, names
String titolo[]; //titoli orario [title]
String griglia[][]; // valori cateogrie  [column][row]

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

Cella[] cell= new Cella[1555];
ArrayList linea;
int min=0;

import processing.serial.*;
Serial port;
boolean messaggio = false;

//SETUP==========================================================================


void setup() {
  //1440px / 900px size
  size(displayWidth, displayHeight);
  background(100);

  // load&parse data
  String url = "data.json"; // < the spreadsheet must be published and available to a public url.
  load_G_Spreadsheet(url);

  //creo nuova griglia
  titolo= new String[1555];
  griglia= new String[1555][150]; // lines  [column][row]

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

      //stampo i dati diversi da quelli precedenti
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






//DRAW==========================================================================


void draw() {


  // contatore di azioni
  if (millis() > tempo+1000) {
    tempo = millis(); 

    background(0);



    //calcolo orario in base alle colonne
    if (orario<column) {

      for ( vero=true; vero==true; lettura++) {

        //leggo se nella colonna finiscono i dati
        if (griglia[orario][lettura]!=null) {

          if (griglia[orario][categoria].equals("whatsapp-base")) { 
            social=0;
            cell[orario]= new Cella(0, height/2-10, social);
            messaggio=true;
          }

          categoria++;
        } //chiudo if del null

        else {
          vero=false;
        }
      }//chiudo ciclo for lettura righe per ogni colonna


      //_________________________________________________________________________________
      //riempio le caselle lasciate vuote dal for dei quadrati colorati

      if (cell[orario]==null) {
        cell[orario]= new Cella(0, height/2-10, social);
      }

      //_________________________________________________________________________________
      //creo la visibitlità dell'orario e delle celle
      if (orario>=59) {

        for (int g=59; g>=0; g--) {
          cell[(orario-g)].sposto();
          cell[(orario-g)].disegna();
        }
      }//chiudo if (orario>60)

      else {

        for (int f=orario; f>=0; f--) { 

          cell[(orario-f)].sposto();
          cell[(orario-f)].disegna();
        }
      }// chiudo else
      //_________________________________________________________________________________



      //******************************************************
      //MESSAGGIO PER ARDUINO DI FACEBOOK

      if (messaggio==true) {
        port.write('H');
      } else {
        port.write('L');
      }
      //******************************************************

      pushStyle();
      noStroke();
      fill(255);
      triangle(1240, 290, 1260, 290, 1250, 300);
      triangle(1240, 610, 1260, 610, 1250, 600);
      popStyle();


      //metto a zero le righe e salto nella colonna successiva
      lettura=0;
      categoria=0;
      orario++;
      vero=true;
      social=1;

      messaggio=false;
    }//chiudo ciclo if delle colonne
  }//chiudo if del contatore "millis"
}






//VOID==========================================================================

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



//VOID==========================================================================

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

//VOID==========================================================================




//CLASS==========================================================================


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
    if (stato==0) {   
      pushStyle();
      noStroke();
      fill(255);
      rect(1260+x, y, 20, 20);
      popStyle();
    } 

    //quadrato nero
    else if (stato==1) {
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
