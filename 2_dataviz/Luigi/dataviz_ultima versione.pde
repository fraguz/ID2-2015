name[] elementi = new name[1000];
materie[] mat = new materie[1000];
int posX, posY, timer; 
int rand=0;
String csv[];
String Data[][];

void setup() {
  
  csv = loadStrings("data.csv");
  Data = new String[csv.length][8];
  for (int i=0; i<csv.length; i++) {
    Data[i] = csv[i].split(",");
  }

  noStroke();
  size(1024, 768);
  textSize(15);

  posX=width/2;  // posizione x dei cerchi
  posY=height/2;  // posizione y dei cerchi

  // setta le posizioni elementi e materie
  drawElement(posX, posY, numEle, diamEle, largEle);
  drawMaterie(posX, posY, numMat, diamMat, largMat, colMat, nameMat);
} // setup

void draw() {

  background(0);

  drawLine();
  reDrawMat();
  reDrawElement();
  drawKeyword();
} // draw

class name { 
  int ypos, xpos, larg; 
  String text;
  name (int y, int x, int largEle, String title) {  
    ypos = y; 
    xpos = x;
    larg=largEle;
    text=title;
  } 

  void update() { 
    fill(255);
    ellipse(xpos, ypos, larg, larg);
  } 

  void mouseOn (int distX, int distY) {
    fill(0);
    ellipse(xpos+distX, ypos+distY, larg, larg);

    fill(0);
    rect(mouseX+10, mouseY+2, 70, -22);
    fill(255);
    textAlign(LEFT);
    text(text, mouseX+14, mouseY-4);
  }
  void mouseOver (int distX, int distY) {
    stroke(0);
    ellipse(xpos+distX, ypos+distY, larg, larg);
    noStroke();
  }
  String testo() {
    return text;
  }
  int Xget() {
    return xpos;
  }
  int Yget() {
    return ypos;
  }
} // class name


// classe materie
class materie { 
  int ypos, xpos, larg; 
  color colorazione;
  String text;
  materie (int y, int x, int largEle, color colore, String testo) {  
    ypos = y; 
    xpos = x;
    larg=largEle;
    colorazione=colore;
    text=testo;
  } 

  void update() { 

    fill(colorazione);
    ellipse(xpos, ypos, larg, larg);
    textAlign(CENTER);
    fill(0);
    text(text, xpos, ypos);
    textAlign(LEFT);
  } 

  void mouseOn (int distX, int distY) {
    fill(0);
    ellipse(xpos+distX, ypos+distY, larg, larg);
  }
  void mouseOver (int distX, int distY) {
    fill(colorazione);
    ellipse(xpos+distX, ypos+distY, larg, larg);
  }

  int Xget() {
    return xpos;
  }
  int Yget() {
    return ypos;
  }
} // class materia

int set=-1;
void drawElement(int x, int y, int max, int diam, int larg) {
  pushMatrix();
  translate(x, y);
  for (int go=0; go<360; go+=360/max) {
    set++;
    elementi[set] = new name(int(diam*cos(radians(go))), int(diam* sin(radians(go))), larg, Data[set][0] );
    elementi[set].update();
  }
  popMatrix();
} // drawElement

int set2=-1;
void drawMaterie(int x, int y, int max, int diam, int larg, color[] colore, String[] name) {
  pushMatrix();
  translate(x, y);
  for (int go=0; go<360; go+=360/max) {
    set2++;
    mat[set2] = new materie(int(diam*cos(radians(go))), int(diam* sin(radians(go))), larg, colore[set2], name[set2] );
    mat[set2].update();
  }
  popMatrix();
} // drawMaterie

void reDrawElement() {
  // controll mouseOn o Over
  for (int i=0; i<numEle; i++) {
    int controlX= elementi[i].Xget()+posX;
    int controlY= elementi[i].Yget()+posY;
    if (mouseX>controlX-largEle/2 && mouseX<controlX+largEle/2 && mouseY>controlY-largEle/2 && mouseY<controlY+largEle/2) {
      String[] var = split(Data[i][2], '_');
      for (int j=0; j<var.length; j++) {
        stroke(colMat[int(var[j])]);
        strokeWeight(2);
        line(posX+elementi[i].Xget(), posY+elementi[i].Yget(), posX+mat[int(var[j])].Xget(), posY+mat[int(var[j])].Yget());
      } 
      strokeWeight(1);
      noStroke();
      elementi[i].mouseOn(posX, posY);
    } else {

      if (Data[i][1].equals("m")) 
        fill(#0066FF); // azzurro

      if (Data[i][1].equals("f")) 
        fill(#FF00FF); // rosa

      elementi[i].mouseOver(posX, posY);
    }
  }
} // reDrawElement

void reDrawMat() {
  pushMatrix();
  translate(posX, posY);
  for (int i=0; i<numMat; i++) 
    mat[i].update();
  popMatrix();
} // reDrawMat

void drawLine() {
  stroke(200);
  for (int i=0; i<numEle; i++) {
    String[] var = split(Data[i][2], '_');
    for (int j=0; j<var.length; j++) {
      line(posX+elementi[i].Xget(), posY+elementi[i].Yget(), posX+mat[int(var[j])].Xget(), posY+mat[int(var[j])].Yget());
    }
  }
  noStroke();
} //drawLine

void drawKeyword() {
  timer++;
  if (timer==1)  rand = int(random(keyword.length));
  if (timer>time)  timer=0;
  fill(255);
  rect(posX-(keyword[rand].length()*6)-2, posY+10, (keyword[rand].length()*12)+4, -30);
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("#"+keyword[rand], posX, posY);
  textSize(15);
} // drawKeyword
