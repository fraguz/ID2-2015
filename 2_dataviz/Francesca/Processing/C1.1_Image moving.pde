/*
This code has been written for educational purpose. 
(Be comprehensive and don't feel sick for me, I already do!)
It loads an image from a local repository and makes it moves in different directions, at the same time.
Then...it continues to do just this!!
by FraGuz
*/

PImage right, left, up, down, rgtup, rgtdown, lftup, lftdown; //named after their directions
int xpos1, xpos2, xpos, ypos1, ypos2, ypos; 
int imgw = 30; //resize the width of the image
int imgh = 30; //resize the height of the image

//sets the anchor point of the images, the size of the window, recalls the object PImage with its functions to load the file.png 
//and sets a value for the x, y coordinates of the images
void setup() {
  imageMode(CENTER);
  size (600, 600);
  right = left = up = down = rgtup = rgtdown = lftup = lftdown = loadImage("1921681664.png"); //loads the same image since this is an exercise
  xpos = xpos1 = xpos2 = width/2; //this might look inappropriate but works fine with the directions
  ypos = ypos1 = ypos2 = height/2;//same as above
}

//assuming that the starting location of the images is in the middle
//makes the images move right, left, up, down and on the diagonals one time
void draw() {
  background(0); //redraws the bg on each frame
  image(right, xpos1, ypos, imgw, imgh);
  xpos1 ++; //increases the x value--->makes the image move along the x axes towards right while the y value doesn't change
  image(left, xpos2, ypos, imgw, imgh);
  xpos2 --; //decreases the x value--->makes the image move along the x axes towards left while the y value doesn't change
  image(up, xpos, ypos1, imgw, imgh);
  ypos1 --; //increases the y value--->makes the image move along the y axes towards down while the x value doesn't change
  image(down, xpos, ypos2, imgw, imgh);
  ypos2 ++; //decreases the y value--->makes the image move along the y axes towards up while the x value doesn't change
  image(rgtup, xpos1, ypos1, imgw, imgh);
  xpos1 ++; //increases the x value while decreases the y values--->makes the image move along the diagonal towards right up
  image(lftdown, xpos2, ypos2, imgw, imgh);
  xpos2 --; //decreases the x value while increases the y values--->makes the image move along the diagonal towards left down
  image(rgtdown, xpos1, ypos2, imgw, imgh);
  ypos1 --; //increases the x value while decreases the y values--->makes the image move along the diagonal towards right down
  image(lftup, xpos2, ypos1, imgw, imgh);
  ypos2 ++; //decreases the x value while decreases the y values--->makes the image move along the diagonal towards right down

  //makes the images repeat the trick! 
  if  (xpos1>width || ypos1>height ||xpos2>width || ypos2>height) { 
    xpos1 = width/2;
    ypos1 = height/2;
    xpos2 = width/2;
    ypos2 = height/2;
  }
}
