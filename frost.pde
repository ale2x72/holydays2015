/*
Season's greetings 2015
 Small code for your holiday grretings by Alessio Erioli
 
 */

Dot d;
DotArray dArr;
color dotCol = color(255), bgCol = color(255, 0, 0); // color(109,234,233); // light blue
boolean anim=false; // set this to true to save animation frames

void setup() {
  // choose one of the following between size() and fullScreen()
  //size(1280, 720, P2D);
  fullScreen(P2D, 2); // 1 - fisrt screen, 2 - second screen, SPAN - all of the connected screens
  smooth(8);
  dArr = new DotArray(1);
  // println(dArr.array.get(0).speed); // this is to check speed and repeat nice results
  background(bgCol);
}

void draw() {
  loadPixels();
  dArr.update();
  if (anim) saveFrame("animation/frame_####.jpg");
  if (dArr.array.size() == 0) { 
    saveFrame("imgs/screenshot_0_####.png");
    exit();
  }
}