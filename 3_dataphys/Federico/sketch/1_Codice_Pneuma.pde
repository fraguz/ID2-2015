//// ____ PROCESSING ____ ////

/*
The MIT License (MIT)
 Copyright (c) 2015 Federico Lo Porto for the course ID2-2015 @ UnirSM
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 Questo sketch preleva dei dati da un google fogli dove ci sono dei valori che simulano
 il rilevamento dell'anidride carbonica all'interno della struttura universitaria 
 di design all'interno della Serenissima Repubblica di San Marino. 
 Lo sketch tramite seriale passa i dati ad Arduino a cui è collegata l'installazione Pneuma.
 
 */

import controlP5.*;
import processing.serial.*;


ControlP5 interfaccia;

import processing.pdf.*;
import java.util.Calendar;


boolean savePDF = false;
boolean timesave = false;

String A_title, B_title, C_title, D_title; //titoli colonne
IntList A_values= new IntList(); // dichiarazione degli array
IntList B_values= new IntList();
IntList C_values= new IntList();
IntList D_values= new IntList();

int i=0;  
int x = 0;
int y = 0;

boolean next = false; 

float tempCO2_est, tempO2_est, tempCO2_int, tempO2_int;
float CO2_est, O2_est, CO2_int, O2_int;
float CO2_ppm=0;

float theta=0.04;
float velocit=0.05;
float zoom = 0.0;
float distanza= 0.0;
float t;  
int lunghezza_array=0;

Serial port;


void setup() {
  size(displayWidth, displayHeight); //fullscreen
  //size(400, 400);
  smooth(8);
  //caricamento foglio google
  String url = "https://spreadsheets.google.com/feeds/cells/1Yri2dQsyWcKnjqRIea028jvbi86DBm2yFS2Zu8WPN3I/od6/public/basic?alt=json"; // < the spreadsheet must be published and available to a public url.
  load_G_Spreadsheet(url);
  println (A_title);  
  println (A_values);  // valore CO2 esterno
  println (B_title);  
  println (B_values); //valore Ossigeno esterno
  println (C_title);  
  println (C_values);  // valore CO2 interno
  println (D_title);  
  println (D_values);  // valore ossigeno interno

  lunghezza_array=C_values.size();


  zoom= map (width, 0.0, displayWidth, 0.0, 3.0);
  distanza= map (width, 0.0, displayWidth, 0.0, 150.0);
  t= map(width, 0.0, displayWidth, 18.0, 32);
  x= width/2;
  y=height/2;

  interfaccia = new ControlP5(this);

/*  // create a group for all the gui element called ADMIN
  Group ADMIN = interfaccia.addGroup("ADMIN")
    .setPosition(10, 20)
      .setWidth(200)
        .setBackgroundHeight(70)
          .setBackgroundColor(color(150))
            ;

  // create a slider for the TriangleMinSize parameter
  // name, minValue, maxValue, defaultValue, x, y, width, height
  interfaccia.addSlider("zoom", 0.0, 80.0, zoom, 10, 10, 100, 14)
    .setGroup(ADMIN)
      ; 

  interfaccia.addSlider("theta", 0.01, 1, 0.05, 10, 25, 100, 14)
    .setGroup(ADMIN)
      ;
  interfaccia.addSlider("velocit", 0.01, 0.1, 0.05, 10, 40, 100, 14)
    .setGroup(ADMIN)
      ;
*/
  println(Serial.list());
  port = new Serial(this, Serial.list()[2], 9600);
}


void draw() {
  background(255, 255, 255); 
  stroke(1);
  strokeWeight(2);
  textSize(t);
  fill(0, 0, 255, 80);  
  textAlign(CENTER);  
  text("PNEUMA", width/2, 100); 
  fill(0);
  noStroke(); 

  if (savePDF) 
    beginRecord(PDF, "respiro_"+timestamp()+".pdf");


  if ((frameCount % 600 == 0)||(i==0)||(next)) {     //condizione di rilvemanto dati, in questo modo i dati vengono estratti in un tempo prestabilito 
    rilevamento(i, C_values);
    if (i>lunghezza_array - 2) 
    {
      i=0;
    }


    if (next) {
      next = false;
      i++;
    } else
    {
      i++;
    }
  
  }
  println(CO2_ppm);
  
  // ad arduino viene trasmesso una lettera corrispondente al range della quantità di ppm dell'anidride carbonica
    if (CO2_ppm<1000) {
      println("fascia A");
      port.write('A');
    }
    if ((CO2_ppm>1000) && (CO2_ppm<1400))
    {
      println("fascia B");
      port.write('B');
    }
    if ((CO2_ppm>1400) && (CO2_ppm<2400))
    {
      println("fascia C");
      port.write('C');
    } 
    if(CO2_ppm>2400)
    {
      println("fascia D");
      port.write('D');
    }


  //println(i); 
  disegna(CO2_int, zoom);
  //port.write(CO2_int);

  if (savePDF) {
    endRecord();
    savePDF = false;
    //endRecord();
  }
  if (timesave)
  {
    timesave= false;
  }
}


void keyPressed() { // SE PREMI SPAZIO CARICHI IL PROSSIMO DATO
  if (key == ' ') {
    next = true;
  }
}

void keyReleased() {
  if (key == 's' || key == 'S'|| (timesave) ) saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') 
  {
    savePDF = false;
    endRecord();
    exit();
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


//rilevazione dei dati
void rilevamento (int i, IntList C_values)
{
  CO2_ppm=(C_values.get(i));
  tempCO2_int = abs (C_values.get(i));
  CO2_int = 2*sqrt(tempCO2_int/PI);
}




//viene disegnato il cerchio sfruttando il movimento della sinusoide del seno 
void disegna( float CO2_int, float zoom)
{
  fill(0, 0, 255, 80);  
  CO2_int *= zoom; //il valore rilevato viene moltiplicato per una costante 
  theta+= velocit ;
  float raggioCO2_int= CO2_int + CO2_int * (sin(theta)+1);
  ellipse(x, y, raggioCO2_int, raggioCO2_int);
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








//FUNZIONE PER CARICARE JSON

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
    if (index.equals("A1") == true) {   //inserisce il titolo
      A_title = value;
    } else
      if (index.equals("B1") == true) { 
      B_title = value;
    } else 
      if (index.equals("C1")== true) {
      C_title = value;
    } else
      if (index.equals("D1")) {
      D_title = value;
    } else
      if (current_column == 'A') { 
      A_values.append(int(value));
    } else
      if (current_column == 'B') { 
      B_values.append(int(value));
    } else
      if (current_column =='C') {
      C_values.append(int(value));
    } else
      if (current_column =='D') {
      D_values.append(int(value));
    }
  }
}
