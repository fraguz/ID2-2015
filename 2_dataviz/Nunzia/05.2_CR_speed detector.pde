import processing.video.*;

Capture video;

PImage prevFrame;

float threshold = 150;
int Mx = 0;
int My = 0;
int ave = 0;

int ballX = width/8;
int ballY = height/8;
int rsp = 5;

int camX=320;
int camY=240;

int timer=0;
int block=0;
int vel=0;
int display=0;
int asp=0;
String[] results = new String[10000];

byte[] nums = { 
  0, 34, 5, 127, 52
};


int clock=0;
int position=0;

void setup() {
  size(camX, camY);
  video = new Capture(this, camX, camY, 30);
  video.start();
  prevFrame = createImage(camX, camY, RGB);

  results[0]="null";
}



void draw() {

  clock++;



  if (video.available()) {

    prevFrame.copy(video, 0, 0, camX, camY, 0, 0, camX, camY); 
    prevFrame.updatePixels();
    video.read();
  }

  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  Mx = 0;
  My = 0;
  ave = 0;


  for (int x = 0; x < camX; x ++ ) {
    for (int y = 0; y < camY; y ++ ) {

      int loc = x + y*camX;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 


      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff > threshold) { 
        pixels[loc] = video.pixels[loc];
        Mx += x;
        My += y;
        ave++;
      } else {

        pixels[loc] = video.pixels[loc];
      }
    }
  }
  fill(255);
  //rect(0, 0, width, height);
  if (ave != 0) { 
    Mx = Mx/ave;
    My = My/ave;
  }
  if (Mx > ballX + rsp/2 && Mx > 50) { //posizione cerchio 
    ballX+= rsp;
  } else if (Mx < ballX - rsp/2 && Mx > 50) {
    ballX-= rsp;
  }
  if (My > ballY + rsp/2 && My > 50) {
    ballY+= rsp;
  } else if (My < ballY - rsp/2 && My > 50) {
    ballY-= rsp;
  }

  ellipse(ballX, ballY, 20, 20);


  updatePixels();
 


  
  noFill();
  ellipse(ballX, ballY, 10, 10);
stroke(255,255,0);
line(ballX,0,ballX,height);


  if (Mx==0 && My==0) {

    asp++;
    if (asp>5 && display!=0) {
      asp=0;
      display=0;


      // println("fermo");
    }


    if (block==0) {
      vel=timer;



      // controlla in base alla velocità
      if (vel<5 && display!=0) {
        display=0;
      }

      if (vel>25 && vel<80 && display!=1) {
        display=1;
        println("veloce");

        results[position]=clock+"_"+"veloce";
        position++;
      }

      if (vel>80 && vel<150 && display!=2) {
        display=2;//180
        println("normale");
        results[position]=clock+"_"+"normale";
        position++;
      }

      if (vel>150 && vel<250 && display!=3) {

        results[position]=clock+"_"+"lento";
        position++;

        display=3;
        println("lento");
      }

      block=1;
    }


    timer=0;
  } else {
    block=0;
    //println("movimento");
    timer++;
  }

  String[] resultsValues = new String[position];

  for (int i =0; i<position; i++) {
    resultsValues[i]=results[i];
  }

  saveStrings("load/result.txt", resultsValues);
  // Writes the bytes to a file
  
 
}
