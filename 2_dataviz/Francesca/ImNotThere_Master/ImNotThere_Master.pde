/*
From the original STITCHY IDENTICONS (c) by Martin Schneider 2012
 this code has been modified for educational purpose.
 Thanks to @Fupete for LOAD GOOGLE SPREADSHEET (github.com/fupete/ID2-2015)
 and to freegeoip.net for the Geolocation of IP addresses API.
 Very special thanks to Giuseppe d'Ambrosio who actually did the hard work 
 of putting the pieces together.
 
 ////// I'M (NOT) THERE //////
 
 MIT License, June 2015, San Marino
 It loads a Gspreadsheet with the source Ip address and the destination IP address
 from the traffic log report of a server firewall.
 The source IPs are transformed into Identicons.
 The destination IPs are encoded into geocoordinates thanks to freegeoip.net API.
 The Identicon appears over San Marino geolocation,
 it moves towards its destination IP address and once it has arrived, it disappears.
 
 by FraGuz 
 */


import perceptify.pdialog.*;
import perceptify.pmd5.*;

PImage bgMap;
PImage bgNoMap;
float mapScreenWidth, mapScreenHeight;  

Stitchy stitchy;
PDialog dialog;

int maxIcons = 5000;
float vel = 1;

icons[] name = new icons[maxIcons];

//source positions
int localX=0; 
int localY=0; 

//destination positions
float[] Xdir = new float [maxIcons]; 
float[] Ydir = new float [maxIcons]; 

//destination IP geocoded variables
float[] longitude = new float[maxIcons];
float[] latitude = new float[maxIcons];

//Identicon speed
float[] velocit = new float[maxIcons];

//string that draws the Identicon
String[] sourceIP = new String[maxIcons];

//Identicon dimensions
float[] dimensions = new float [maxIcons];


void setup() {

  noSmooth();
  size(1440, 720);

  // set coordinates of San Marino
  localX=int (geoToPixelX(12.4463)); 
  localY=int (geoToPixelY(43.9366));

  bgMap   = loadImage("image2.png");
  bgNoMap = loadImage("image1.png");

  mapScreenWidth  = width;
  mapScreenHeight = height;

  //heavier file _ takes few minutes to load
  String url = "https://spreadsheets.google.com/feeds/cells/1OVZzi-4PhccTvinEfRKGHma-RXmYTBBwpAkryRM4eIU/od6/public/basic?alt=json"; 
  //lighter file
  //String url = "https://spreadsheets.google.com/feeds/cells/1M7j4-Fed5rOC_vi4M-ckvIACYet8kMIlk8Ka8bXkyDM/od6/public/basic?alt=json";  

  load_G_Spreadsheet(url);

  for (int i=0; i<maxRow[1]; i++) {
    sourceIP[i] = row_string[1][i];
    velocit[i] = 10; //change this to speed the Identicons up
    dimensions[i]=0.07; //change this to set the Identicons scale
    name[i]= new icons(0, 0, velocit[i], sourceIP[i], dimensions[i]); //objects settings
  }

  for (int i=1; i<maxRow[0]; i++) {
    longitude[i-1] = IPlongitude(row_string[0][i]);
    latitude[i-1] = IPlatitude(row_string[0][i]);
  }

  // prints values
  for (int i=0; i<maxRow[0]; i++) {
    Xdir[i]=geoToPixelX(longitude[i]);
    Ydir[i]=geoToPixelY(latitude[i]);
    println("USER: "+sourceIP[i]+" DESTINATION = "+row_string[0][i]+" (long:"+longitude[i]+" ; lat:"+latitude[i]+")");
  }

  dialog = new ModalPDialog(this);
} // setup

int timer=0;
int j=2;

void draw() {

  noStroke();

  background(bgMap);
 
  //fill(#ffffff, 180); //<>// //<>//
  //rect(0, 0, width, height);

  timer++;
  if (timer>250 && timer<300) {
    name[j-1].canc();
  }

  if (timer>300) {
    timer=0;
    j++;
  }

  if (j<maxRow[1]) {
    for (int i=1; i<j; i++) {
      name[i].update(Xdir[i]-localX, Ydir[i]-localY);  
      name[i].sketch();
    }
  }
}
/*void mousePressed(){
   if (mousePressed) {
    background(bgMap);
    delay(5000);
  } else {
       background(bgNoMap);
  } 
  }*/