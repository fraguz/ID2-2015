////// CLASS_ICONS //////

class icons { 
  
  float ypos, xpos, speed;
  String name1;
  float velo;

  icons (float x, float y, float s, String name, float vel) {  
    name1 = name;
    xpos = x; 
    ypos = y; 
    speed = s;
    velo = vel;
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