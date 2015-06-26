// -
// G_Spreadsheet_Data_TABLE [JSON / Public url > TABLE | csv]
// © Daniele @ Fupete and Giuseppe D'Ambrosio for the course ID2 @ UnirSM  
// github.com/fupete — github.com/Fupete/ID2-2015
// Educational purpose, MIT License, march 2015, San Marino
// —
// Load and parse JSON data from a public Google Spreadsheet Url in a two-dimensional array matrix [columns][row].
// The table is a series of lists (columns), where the first value is the title of the list.
// draw table in the sketch and save a table with exel file (CSV format) in the data folder
// Credits to Jer Thorp on why connect G_Spreadsheet to Processing http://goo.gl/MQNsxr
// -
// Rappresentazione di dati relativi alle risorse messe a disposizione dall'università come strumenti per il percorso di studi degli studenti
// Premere i tasti 1,2,3,4,5,6,q,w,e,r,t,y per avere la visione dei diversi mesi da Gennaio a Dicembre.
// Premere il tasto I per le info.

String all_title[] = new String[100];  // titles  (first column value)
String row_string[][] = new String[100][1000]; // lines  [column][row]
float row_float[][]= new float[100][100]; // array used to convert a string list to numeric list
int  maxColumn=0; // max number of columns
int[] maxRow = new int[100];  // max number of rows for each column


float cx=650; // centro di rotazione del sistema
float cy=370;
float agg; // valore aggiunta gradi per non sovrapporre i cerchi
int cont=0; // contatore step/mesi

float diametroUni; //variabile che corrisponde alla distanza dei cerchi dal centro del sistema 
float diametroUniPrec; //variabile che legge il valore precedente
float dim; // variabile che corrisponde alle dimensioni dei cerchi
float i; // variabilea per gestione delle rotazioni
float vel; // variabile che corrisponde alla velocità di rotazione

int tempo=0;

int id; // riconoscimento colonna

Cerchio cerchio0; // oggetti cerchi
Cerchio cerchio1;
Cerchio cerchio2;
Cerchio cerchio3;
Cerchio cerchio4;
Cerchio cerchio5;
Cerchio cerchio6;
Cerchio cerchio7;
Cerchio cerchio8;
Cerchio cerchio9;


CerchioCentrale cerchiouni;

CerchioEsterno esterno0;
CerchioEsterno esterno1;
CerchioEsterno esterno2;
CerchioEsterno esterno3;
CerchioEsterno esterno4;



float zoom=0;


float areaPrec;




void setup() {

  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100);

  smooth();

  String url = "https://spreadsheets.google.com/feeds/cells/1EZJKMKEsyp7cbP-fznwGT4_oQUHvDBEc7evFy4X5Ff0/od6/public/basic?alt=json"; // < the spreadsheet must be published and available to a public url.

  // Patched function to load tables with an unlimited number of columns, the function return matrix size (num of column and num of row)
  // Note: null values are not loaded because it loads the data in lists format
  // while in the case of a matrix format enter a value (0 or null) in the worksheet google spreadsheets
  load_G_Spreadsheet(url);

  // creates a table with exel file (CSV format) in the data folder (data/table.csv)
  table (all_title, row_string, maxColumn, maxRow);

  // print the json in compiler
  printTable (all_title, row_string, maxColumn, maxRow);

  // draw table in the sketch, the first two values are the (x,y) position of the table
  //drawTable (20, 20, all_title, row_string, maxColumn, maxRow);

  // Note: The table is all composed of string data,
  // In the case of a numeric column, you can use this function
  // to get an array of decimal numbers (convert string array to decimal array)
  convertToFloat (row_string, maxRow, row_float, 2 /* <- num column to convert */);

  cerchio0 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 0);
  cerchio1 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 1);
  cerchio2 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 2);
  cerchio3 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 3);
  cerchio4 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 4);
  cerchio5 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 5);
  cerchio6 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 6);
  cerchio7 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 7);
  cerchio8 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 8);
  cerchio9 = new Cerchio(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 9);

  cerchiouni= new CerchioCentrale(cx, cy, diametroUni, diametroUniPrec);

  esterno0 = new CerchioEsterno(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 0, 300);
  esterno1 = new CerchioEsterno(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 0, 300);
  esterno2 = new CerchioEsterno(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 0, 300);
  esterno3 = new CerchioEsterno(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 0, 300);
  esterno4 = new CerchioEsterno(color(0, 0, 0), dim, diametroUni, agg, i, vel, cx, cy, 0, 300);

  zoom=map(width, 0, displayWidth, 0, 80);
} // fine setup


void draw() {
  background(0, 0, 80);
  cont=keyPressed(cont);

  // premendo il tasto I abbiamo la visualizzazione automatica di tutto l'anno mese per mese
  if (key == ' ') { 
    if (millis()>tempo+1000) {
      tempo=millis();
      cont++;
      if (cont>11) {
        cont=0;
      }
    }
  }

  i=0.5;

  // acquisizione dal database delle dimensioni dei cerchi corrispondenti alle diverse categorie disposte in diverse colonne
  float dim0 = zoom* table.getFloat(cont, "acqua"); 
  float dim1 = zoom* table.getFloat(cont, "elettricita");
  float dim2 = zoom* table.getFloat(cont, "riscaldamento");
  float dim3 = zoom* table.getFloat(cont, "materiali");
  float dim4 = zoom* table.getFloat(cont, "stampe");
  float dim5 = zoom* (table.getFloat(cont, "conferenze"))*20;
  float dim6 = zoom* (table.getFloat(cont, "docenti"))*10;
  float dim7 = zoom* (table.getFloat(cont, "studenti"))*0.6;
  float dim8 = zoom* (table.getFloat(cont, "libri"))*2;
  float dim9 = zoom* table.getFloat(cont, "connessione")*0.8;

  if (cont == 7) {
    dim8=dim8/2;
  }

  float area = zoom* table.getFloat(cont, "uni"); 
  diametroUni= (2*sqrt(area/PI)); //diametro cerchio centrale in base al totale delle risorse rese disponibili

  if (cont==0) {
    areaPrec= zoom* table.getFloat(11, "uni");
     diametroUniPrec=diametroUni;
  } else {
    areaPrec = zoom* table.getFloat(cont-1, "uni");
    diametroUniPrec= (2*sqrt(areaPrec/PI));
 }


  vel = table.getFloat(cont, "uni")/250; //velocità in base al totale delle risorse rese disponibili

  fill(0, 0, 100); 
  textSize(30);
  text("Mese di "+ table.getString(cont, "mesi"), 75, 100); // testo per indicare i diversi mesi
  fill(360, 100, 70); 
  textSize(16);
  text("Risorse concrete", 120, 135);
  fill(230, 100, 70); 
  text("Risorse astratte", 120, 160);
  textSize(20);
  fill(315, 100, 70);
  text("Totale", 148, 195);
  //println(vel);
  //println(diametroUni);

  esterno0.disegno(area/10, vel, color(120, 100, dim0/zoom), diametroUni, 10, 0);
  esterno1.disegno(area/10, vel, color(120, 100, dim0/zoom), diametroUni, 82, 0);
  esterno2.disegno(area/10, vel, color(120, 100, dim0/zoom), diametroUni, 154, 0);
  esterno3.disegno(area/10, vel, color(120, 100, dim0/zoom), diametroUni, 226, 0);
  esterno4.disegno(area/10, vel, color(120, 100, dim0/zoom), diametroUni, 298, 0);

  // disegno dei cerchi
  cerchio0.disegno(dim0, vel, color(360, 100, dim0/zoom), diametroUni, 0, 0);
  cerchio1.disegno(dim1, vel, color(360, 100, dim1/zoom), diametroUni, 36, 1);
  cerchio2.disegno(dim2, vel, color(360, 100, dim2/zoom), diametroUni, 72, 2);
  cerchio3.disegno(dim3, vel, color(360, 100, dim3/zoom), diametroUni, 108, 3);
  cerchio4.disegno(dim4, vel, color(360, 100, dim4/zoom), diametroUni, 144, 4);
  cerchio5.disegno(dim5, vel, color(230, 100, dim5/zoom), diametroUni, 180, 5);
  cerchio6.disegno(dim6, vel, color(230, 100, dim6/zoom), diametroUni, 216, 6);
  cerchio7.disegno(dim7, vel, color(230, 100, dim7/zoom), diametroUni, 252, 7);
  cerchio8.disegno(dim8, vel, color(230, 100, dim8/zoom), diametroUni, 288, 8);
  cerchio9.disegno(dim9, vel, color(230, 100, dim8/zoom), diametroUni, 324, 9);



  noStroke();
  float mediablu= (dim0/zoom+dim1/zoom+dim2/zoom+dim3/zoom+dim4/zoom)/5;
  float mediarossa=(dim5/zoom+dim6/zoom+dim7/zoom+dim8/zoom+dim9/zoom)/5;
  fill(color( 305, 90, ((mediablu+mediarossa)/2)));

  cerchiouni.disegnoCentrale(diametroUni, diametroUniPrec);
} // fine draw






class Cerchio {
  color colore;
  float dim;// d = dimensione
  float dist;//distanza dal centro
  float i;
  float vel;//velocità rotazione

  Cerchio(color tempcolore, float tempdim, float tempdist, float tempagg, float tempi, float tempvel, float tempcx, float tempcy, int tempid) { 
    colore=tempcolore;
    dim=tempdim;
    dist=tempdist;
    agg=tempagg;
    i=tempi;
    vel=tempvel;
    cx=tempcx;
    cy=tempcy;
    id=tempid;
  }



  void disegno(float dimensione, float veloc, color col, float distanza, float gradi, int colonna) {
    dim=dimensione;
    colore=col;
    agg= gradi;
    vel=veloc;
    dist=distanza;
    gradi=radians(agg);
    id=colonna;
    float angulo=radians(i);
    float px=cx+(cos(angulo+gradi)*dist/2); //posizione cerchio X
    float py=cy+(sin(angulo+gradi)*dist/2); //posizione cerchio Y
    i+=vel; // + o - danno il senso alla rotazione

    boolean x=false; // variabile per attivazione testo
    // disegna le rette dal centro del sistema al centro dei cerchi, se la dimensione degli stessi è diversa da zero
    if (dim!=0) {
      float diamPrec;

      /*strokeWeight(5);
       stroke(0, 0, 80);
       line(cx, cy, px, py);*/
      noStroke();
      fill(colore);
      float diametro = 2*sqrt(dim/PI);

      diamPrec=diametro;

      if (diamPrec >= diametro ) {
        diametro--;
        ellipse(px, py, diametro, diametro);
      }

      if (diamPrec <= diametro ) {
        diametro++;
        ellipse(px, py, diametro, diametro);
      }

      // testi riguardanti i dati relativi ad ogni cerchio esterno (risorse)
      if (key == 'i' && x==false) {
        textSize(14);
        text((all_title[id]+" "+ dim), px-30, ((py-dim)-4));
        x=true;
      }
    }
  }
}



Table table; 
// creates a table with exel file (CSV format) in the data folder
Table table (String all_title[], String row_string[][], int maxColumn, int[] maxRow) {

  table = new Table();  // create a table


    for (int i = 0; i < maxColumn; i++) { // add new column and insert the name 
    table.addColumn(all_title[i]);
  }

  // bestHighCol is the number of rows in the longer column
  int bestHighCol = maxRow [0];

  for (int i = 1; i < bestHighCol; i++) {   // calculating bestHighCol
    if (maxRow [i]>bestHighCol) {
      bestHighCol=maxRow [i];
    }
  }

  for (int i = 1; i < bestHighCol; i++) {
    TableRow newRow = table.addRow();  // add a row 
    for (int j = 0; j < maxColumn; j++) {
      newRow.setString(all_title[j], row_string[j][i]);  // inserts the value in the line (row)
    }
  }

  saveTable(table, "data/table.csv");
  return table; // save and return table format in processing sketch
}

// draw simple table in sketch
void drawTable (int x, int y, String all_title[], String row_string[][], int maxColumn, int[] maxRow) {
  int distance_X = 0;
  int distance_Y = 0;
  translate(x, y);
  // bestHighCol is the number of rows in the longer column
  int bestHighCol = maxRow [0];
  for (int i = 1; i < bestHighCol; i++) {   // calculating bestHighCol
    if (maxRow [i]>bestHighCol) {
      bestHighCol=maxRow [i];
    }
  }
  rect(0, -4, 130*(maxColumn), (bestHighCol-1)*35); // border

  for (int i =0; i<maxColumn; i++) {
    fill(0);
    text (all_title[i], distance_X+4, distance_Y+15 ); // vertical lines
    line(distance_X, -4, distance_X, ((bestHighCol-1)*35)-4) ; // title 1 row
    for (int j = 1; j < maxRow[i]; j++) {
      text (row_string[i][j], distance_X +4, distance_Y, distance_X+104, distance_Y ); // lists 
      line(0, distance_Y-4, 130*(maxColumn), distance_Y-4); // horizontal lines
      distance_Y+=35;
    }
    distance_X+=130;
    distance_Y=0;
  }
}

void printTable (String all_title[], String row_string[][], int maxColumn, int[] maxRow) {

  for (int i =0; i<maxColumn; i++) { // print the json
    println (all_title[i]+":");
    println (); 
    for (int j = 1; j < maxRow[i]; j++) {
      print ("["+row_string[i][j]+"]  ");
    }
    println ();  
    println ();
  }
}

/// function to rapid convert the string list in deciman numbers list
void convertToFloat (String row_string[][], int[] maxRow, float row_float[][], int col) {
  for (int i = 1; i < maxRow[col]; i++) {
    row_float[col][i]= int (row_string[col][i]);
  }
}


void load_G_Spreadsheet(String url) {

  JSONObject G_Spreadsheet_data = null;

  try 
  { 
    G_Spreadsheet_data = loadJSONObject(url);
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
    parse_G_Spreadsheet_JSON(G_Spreadsheet_data); // < this start the magic
} 

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



    /** start patched function **/

    // String used to process the json
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    // search the max number of column
    for (int r= 0; r<str.length (); r++ ) {
      if ( index.indexOf(str.charAt(r)+str(1)) == 0) {  
        maxColumn=r+1;  // Count the number of columns until it finds more
      }
    }

    for (int j= 0; j< maxColumn; j++ ) {

      // search the title of the column and inserts it in the all_title array [j] according to its location j
      // ecample column 1 (j=1) ... column n (j=n)
      if (index.equals(str.charAt(j)+str(1)) == true) { 
        all_title[j]=value;
      }

      // search all the line (row) of a  specific column [j] 
      if (current_column == str.charAt(j)) { 
        row_string[j][maxRow[j]]=value;       //  maxRow is the number of rows for each column
        maxRow[j]++;
      }
    }
    /* end */
  }
} 
