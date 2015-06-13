/*From the original STITCHY IDENTICONS by Martin Schneider
 this code has been modified for educational purpose.
 It loads a Gspreadsheet and transforms Ip adresses into Identicons.
 The identicons move in pre-established directions.
 by Giuseppe D'Ambrosio and FraGuz
 */

import perceptify.pdialog.*;
import perceptify.pmd5.*;

Stitchy stitchy;
PDialog dialog;


int maxIcons = 8;
float velocity = 1;

icons[] name = new icons[maxIcons];

/// eight main directions
int[] directions = {
  1, 2, 3, 4, 5, 6, 7, 8
};

// value of speed for each identicon
float[] mainSpeed = {
  1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5
};

// value to draw the identicon  
String[] sourceIP = {
  "prova", "fsadgfas", "fgaga", "fdsagf", "A_values", "fsadgfas", "fgaga", "fdsagf"
};

// object's dimensions
float[] dimensions = { 
  0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2
};

void setup() {
  size(600, 600);
  noSmooth();
 //it loas the GSpreadsheet
  String url = "https://spreadsheets.google.com/feeds/cells/1OVZzi-4PhccTvinEfRKGHma-RXmYTBBwpAkryRM4eIU/od6/public/basic?alt=json";
  load_G_Spreadsheet(url);
  println (A_title);  
  println (A_values);  // < column A, sourceIP
  println (B_title);  
  println (B_values);  // < column B, destinationIP
  
  for (int i=0; i<maxIcons; i++) {
    name[i]= new icons(0, 0, mainSpeed[i], sourceIP[i], dimensions[i]);
  }
}

void draw() {
  background(#ffffff);

  for (int i=0; i<maxIcons; i++) {
    name[i].ip(sourceIP[i]);
    name[i].update(directions[i]);  
    name[i].sketch();
  }
}

/// it draws the identicon
void identIcon (float x, float y, String name, float velocity) {
  pushMatrix();
  translate (x, y);
  stitchy = new Stitchy(name);
  stitchy.maximize(velocity);
  stitchy.center();
  stitchy.draw();
  popMatrix();
}

////// CLASS_ICONS //////

// array objects

class icons { 
  float ypos, xpos, speed;
  String name1;
  float velo;
  icons (float y, float x, float s, String name, float velocity) {  
    name1=name;
    ypos = y; 
    xpos = x; 
    speed = s;
    velo = velocity;
  } 

  // void ip (String name){
  //name1 = (A_values);
  //}

  void update(int dir) { 
    if (dir==1) {
      ypos += speed; //down
    }

    if (dir==2) {
      xpos += speed; //right
    }

    if (dir==3) {
      ypos -= speed; //up
    }

    if (dir==4) {
      xpos -= speed; //left
    }

    if (dir==5) { 
      ypos = xpos += speed; //rightdown x+ y+
    }

    if (dir==6) { //rightup x+ y-
      ypos -= speed;
      xpos += speed;
    }

    if (dir==7) {
      ypos = xpos -= speed; //leftup x- y-
    }

    if (dir==8) { 
      ypos += speed;
      xpos -= speed; //leftdown x- y+
    }
  } 

  void sketch() {
    identIcon(xpos, ypos, name1, velo);
  }
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
     int[] tincture_ids = { 0 };
     
     // black and red may not touch
     if( !contains(neighbor_ids, 2)) {
       tincture_ids = append(tincture_ids, 1);
     }
     
     // and vice versa
     if( !contains(neighbor_ids, 1)) {
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
    if(x > 0) {
      // left neighbor
      neighbors = append(neighbors, matrix[y][x-1]);
    }
    if(y > 0) {
      // top neighbor
      neighbors = append(neighbors, matrix[y-1][x]);
    }
    
    return neighbors;
  } 
}

// helper functions
boolean contains(int[] a, int e) {
  for(int element : a) if(element == e) return true;
  return false;
}

////// ICON //////

// displaying an icon with a silver lining and some layout magic

class Icon {
  
  PImage img;
  int x, y, w, h;
  int b = 2;

  void draw() {

    stroke(#cccccc);
    noFill();
    rect(int(x), int(y), w-1, h-1);
    image(img, x+b, y+b, w-2*b, h-2*b);
  }
    
  void center() {
     float d = min(width, height);
     x = (width - w) / 2;
     y = (height - h) / 2;
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
  if(! img.smooth) {
    float w0 = img.width;
    float h0 = img.height;
    for(int y = 0; y < w1; y++) { 
      for(int x = 0; x < h1; x++) {
        int xs = int(x * h0 / h1);
        int ys = int(y * w0 / w1);
        color c = img.get(xs, ys);
        set(x0 + x, y0 + y, c);
      }
    }
  }
}

////// LOADGSPREADSHEET //////

// -
// G_Spreadsheet_Data 0.1 [JSON / Public url]
// © Daniele @ Fupete for the course ID2 @ UnirSM  
// github.com/fupete — github.com/Fupete/ID2-2015
// Educational purpose, MIT License, march 2015, San Marino
// —
// Load and parse JSON data from a public Google Spreadsheet Url
// Collect columns contents in List arrays (A_values, B_values, ...) 
// and column titles in String variables (A_title, B_title, ...)
// Credits to Jer Thorp on why connect G_Spreadsheet to Processing http://goo.gl/MQNsxr
// holders for title/List values <<<< modify to your needs! <<<<
String A_title, B_title; // < holders for column titles, first row, ex. title will be the content from A1, B1, ...
StringList A_values = new StringList(); // < column A, strings, Source address
StringList B_values = new StringList(); // < column B, strings, Destination address


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
    parse_G_Spreadsheet_JSON(G_Spreadsheet_data); // < this starts the magic
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

    // fill the right title/List values
    if (index.equals("A1") == true) { 
      A_title = value;
    } else
      if (index.equals("B1") == true) { 
      B_title = value;
    } else 
      if (current_column == 'A') { 
      A_values.append(value);
    } else
      if (current_column == 'B') { 
      B_values.append(value);
    }
  }
} 


////// PATTERNS //////

int[][] heraldicPattern(int number, int colors, int size, HeraldryFn heraldy, NeighborFn neighbor) {
  
  int d = size * 2 - 1;
  int[][] matrix = new int[d][d];
  int counter = 0;
  
  // paint the background blue - just for testing
  for(int y = 0; y < d; y++) {
    for(int x = 0; x < d; x++) {
      matrix[y][x] = 3;
    }
  }
  
  // iterate over all cells below the matrix diagonal
  for(int x = 0; x < size; x++) {
    for(int y = 0; y <= x; y++) {
      
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

////// STITCHY //////

PImage createStitchy(String seed) {
  
  // padding the seed so we have at least 6 digits - just in case
  seed = "000000".substring(0, max(6 - seed.length(), 0)) + seed;
  // println("Seed: " + seed);
  
  // use only the first 6 hex-digits as seed ( 24 bit = 16.777.216 possibilities )
  int number = unhex(seed.substring(0, 6));

  // red-white-black palette as used in hungarian x-stitch patterns
  color[] palette = { #ffffff, #000000, #ff0000, #cccccc };
  
  // 5 columns, triangle, 3 colors = 15 pixels * 3 colors (max 14.348.907 possibilities)
  int colors = 3;
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
