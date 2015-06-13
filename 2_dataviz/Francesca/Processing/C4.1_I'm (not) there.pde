/*From the original STITCHY IDENTICONS (c) Martin Schneider 2012
 this code has been modified for educational purpose.
 It loads a Gspreadsheet and transforms Source Ip adresses into Identicons.
 The identicons move in a geolocated direction given by the destination Ip.
 Full .PDEs and libraries @ https://drive.google.com/file/d/0B96gF2LFRSchS0QzMmxseERDY3c/view?usp=sharing
 by Giuseppe D'Ambrosio and FraGuz
 */

import perceptify.pdialog.*;
import perceptify.pmd5.*;

//PImage backgroundMap;
float mapScreenWidth, mapScreenHeight;  

Stitchy stitchy;
PDialog dialog;

int maxIcons = 1000;
float vel = 1;

icons[] name = new icons[maxIcons];

//source position
int localX=0; 
int localY=0; // y source position

//destination position
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
  size(1440, 768);

  // sets the coordinates of San Marino
  localX=int (geoToPixelX(12.4463)); 
  localY=int (geoToPixelY(43.9366));

  //backgroundMap   = loadImage("earthicefreemask.gif");
  //mapScreenWidth  = width;
  //mapScreenHeight = height;

  String url = "https://spreadsheets.google.com/feeds/cells/1OVZzi-4PhccTvinEfRKGHma-RXmYTBBwpAkryRM4eIU/od6/public/basic?alt=json"; //original Gss

  //String url = "https://spreadsheets.google.com/feeds/cells/1M7j4-Fed5rOC_vi4M-ckvIACYet8kMIlk8Ka8bXkyDM/od6/public/basic?alt=json";  //attempt#1 Gss

  load_G_Spreadsheet(url);

  for (int i=0; i<maxRow[1]; i++) {
    sourceIP[i] = row_string[1][i];
    velocit[i] = 3.5; 
    dimensions[i]=0.07;
    name[i]= new icons(0, 0, velocit[i], sourceIP[i], dimensions[i]); //oject settings
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
  fill(#ffffff, 180);
  rect(0, 0, width, height);

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


////// CLASS_ICONS /////

class icons { 
  float ypos, xpos, speed;
  String name1;
  float velo;

  icons (float y, float x, float s, String name, float vel) {  
    name1=name;
    ypos = y; 
    xpos = x; 
    speed = s;
    velo=vel;
  } 

  float a=0;
  float b=0;

  void update(float a1, float b1) { 

    if (a1>a) a+=speed;
    if (a1<a) a-=speed;
    if (b1>b) b+=speed;
    if (b1<b) b-=speed;
  } 

  void sketch() {

    identIcon(a, b, name1, velo);
  }
  float canc=1;

  void canc() {
    if (velo>0.001)
      velo-=0.01;
  }
} 

void identIcon (float x, float y, String nome, float vel) {
  pushMatrix();
  translate (x, y);
  stitchy = new Stitchy(nome);
  stitchy.maximize(vel);
  stitchy.center(localX, localY);
  stitchy.draw();
  popMatrix();
}


////// HERALDRY //////

// heraldry is the medieval art + science, defining which colors may appear next to each other on a coat of arms ...

// function to return valid colors, gived the neighboring colors
interface HeraldryFn {
  int[] fn(int[] neighbor_ids);
}

class XStitchHeraldry implements HeraldryFn {
  int[]  fn(int[] neighbor_ids) {

    // white is always an option
    int[] tincture_ids = { 
      0
    };

    // black and red may not touch
    if ( !contains(neighbor_ids, 2)) {
      tincture_ids = append(tincture_ids, 1);
    }

    // and vice versa
    if ( !contains(neighbor_ids, 1)) {
      tincture_ids = append(tincture_ids, 2);
    }

    return tincture_ids;
  }
}


////// NEIGHBORS //////

// function to return neighbors of a cell
interface NeighborFn { 
  int[] fn(int[][] matrix, int x, int y);
}

// return preceding neighbors in a triangle-shaped grid 
class TriangleNeighbors implements NeighborFn {
  int[] fn(int[][] matrix, int x, int y) {
    int[] neighbors = new int[0];
    if (x > 0) {
      // left neighbor
      neighbors = append(neighbors, matrix[y][x-1]);
    }
    if (y > 0) {
      // top neighbor
      neighbors = append(neighbors, matrix[y-1][x]);
    }

    return neighbors;
  }
}

// helper functions
boolean contains(int[] a, int e) {
  for (int element : a) if (element == e) return true;
  return false;
}


////// ICON //////

// displaying an icon with a silver lining and some layout magic

class Icon {

  PImage img;
  int x, y, w, h;
  int b = 2;

  void draw() {

    //stroke(#cccccc);
    noFill();
    rect(int(x), int(y), w-1, h-1);

    image(img, x+b, y+b, w-2*b, h-2*b);
  }

  void center(int Sxx, int Syy) {
    float d = min(Sxx, Syy);
    x = Sxx-w/2;
    y = Syy-h/2;
  }

  void resize(int _w, int _h) {
    w = _w; 
    h = _h;
  }

  void maximize(float factor) {
    int dmax = int(min(width, height) * factor);
    resize(dmax, dmax);
  }
}

// displaying a stitchy icon

class Stitchy extends Icon {

  String name;

  Stitchy(String name) {
    String code = Pmd5.encode(name);
    img = createStitchy(code);
    this.name = name;
  }

  // make sure the size of the actual image is a multiple of the pixel size
  // so all scaled pixels are of equal size

    void resize(int _w, int _h) {
    int d = img.width;
    w = int((_w - 2*b) / d) * d + 2*b; 
    h = int((_h - 2*b) / d) * d + 2*b;
  }
}

// fixing a pjs image bug (no bilinear filter when blitting an image in noSmooth mode)
void image(PGraphics img, int x0, int y0, int w1, int h1) {
  if (! img.smooth) {
    float w0 = img.width;
    float h0 = img.height;
    for (int y = 0; y < w1; y++) { 
      for (int x = 0; x < h1; x++) {
        int xs = int(x * h0 / h1);
        int ys = int(y * w0 / w1);
        color c = img.get(xs, ys);

        set(x0 + x, y0 + y, c);
      }
    }
  }
}


////// LOAD_GSPREADSHEET //////
// -
// G_Spreadsheet_Data TABLE [JSON / Public url]
// © Daniele @ Fupete for the course ID2 @ UnirSM  
// Update table version by Giuseppe D'Ambrosio 
// github.com/fupete — github.com/Fupete/ID2-2015
// Educational purpose, MIT License, march 2015, San Marino
// —


String all_title[] = new String[100];  // titles  (first column value)
String row_string[][] = new String[100][1000]; // lines  [column][row]
int[] maxRow = new int[1000];  // max number of rows for each column
int  maxColumn=0; // max number of columns

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



    /** starts patched function **/

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

////// LOAD_IPGEOCODE //////
// recalls the API from telize.com and geolocates the destination IP

JSONObject geocode;

float IPlongitude(String date) {

 geocode = loadJSONObject("http://www.telize.com/geoip/"+date);

  float longitude = geocode.getFloat("longitude");
  return(longitude);
}

float IPlatitude(String date) {

  geocode = loadJSONObject("http://www.telize.com/geoip/"+date);

  float latitude = geocode.getFloat("latitude");
  return(latitude);
}

float pixelX= 0;
float pixelY= 0;

// translates coordinates into pixels
public float geoToPixelX(float lon)
{
  if (lon>0)
    pixelX = map(lon, -180, 0, 0, width/2);
  if (lon<0)
    pixelX = map(lon, 0, 180, width/2, width);

  return pixelX;
}

public float geoToPixelY(float lat)
{
  if (lat<0)
    pixelY = map(lat, -90, 0, height, height/2);
  if (lat>0)
    pixelY = map(lat, 0, 90, height/2, 0);

  return pixelY ;
}

////// PATTERNFNS //////

////// PATTERNS //////

int[][] heraldicPattern(int number, int colors, int size, HeraldryFn heraldy, NeighborFn neighbor) {

  int d = size * 2 - 1;
  int[][] matrix = new int[d][d];
  int counter = 0;

  // paint the background blue - just for testing
  for (int y = 0; y < d; y++) {
    for (int x = 0; x < d; x++) {
      matrix[y][x] = 3;
    }
  }

  // iterate over all cells below the matrix diagonal
  for (int x = 0; x < size; x++) {
    for (int y = 0; y <= x; y++) {

      // determine digits to be allowed
      int[] neighbor_digits = neighbor.fn(matrix, x, y);
      int[] allowed_digits = heraldy.fn(neighbor_digits);

      // select one
      int allowed_colors = allowed_digits.length;
      int selected_digit = allowed_digits[number %  allowed_colors];

      // add the cell below the diagonal
      matrix[x][y] = selected_digit;
      // add the reflection above the diagonal
      matrix[y][x] = selected_digit;

      // reduce the number
      number = int(int(number) / colors);
    }
  }

  return matrix;
}

///// STITCHY /////

PImage createStitchy(String seed) {

  // padding the seed so we have at least 6 digits - just in case
  seed = "000000".substring(0, max(6 - seed.length(), 0)) + seed;
  // println("Seed: " + seed);

  // use only the first 6 hex-digits as seed ( 24 bit = 16.777.216 possibilities )
  int number = unhex(seed.substring(0, 6)); 

  // red-white-black palette as used in hungarian x-stitch patterns
  color[] palette = { 
    #ffffff, #89CACc, #A88ADA, #cccccc, #ffffff, #89CACc, #A88ADA, #cccccc, #ffffff, #89CACc, #A88ADA, #cccccc
  };


  // 5 columns, triangle, 3 colors = 15 pixels * 3 colors (max 14.348.907 possibilities)
  int colors =  3;
  int columns = 5;
  HeraldryFn heraldryfn = new XStitchHeraldry();
  NeighborFn neighborfn = new TriangleNeighbors();

  // create x-stitch pattern
  int[][] matrix = heraldicPattern(number, colors, columns, heraldryfn, neighborfn);

  // create image from matrix
  int c = columns - 1;
  int d = 2 * columns - 1;
  PImage img = createImage(d, d, RGB); 
  img.loadPixels();

  // create 4 reflections from the matrix
  for (int y = 0; y < columns; y++) {
    for (int x = 0; x < columns; x++) {
      img.pixels[(c-y)*d + c+x] = palette[matrix[y][x]];
      img.pixels[(c-y)*d + c-x] = palette[matrix[y][x]];
      img.pixels[(c+y)*d + c+x] = palette[matrix[y][x]];
      img.pixels[(c+y)*d + c-x] = palette[matrix[y][x]];
    }
  }

  img.updatePixels();
  return img;
}
