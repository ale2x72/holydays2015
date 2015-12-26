class Dot {
  PVector pos, speed;
  float angle, angInc;
  float life, lifeDec;
  boolean alive;


  Dot( PVector pos, PVector speed, float angle, float angInc) {

    this.pos = pos;
    this.speed = speed;
    this.angle = angle;
    this.angInc=angInc;
    alive = true;
    life=1.0;
    lifeDec = 0.01;
  }

  void update() {
    if (alive) {
      move();
      check();
      display();
      if (life< 0.55 && life > 0.53) sprout(); // else println(life);
      life-=lifeDec;
    }
  }

  void sprout() {
    //println("sprout!");
    PVector newSpeed = speed.copy();
    newSpeed.rotate(PI*0.3);
    Dot d = new Dot(pos.copy(), newSpeed.copy(), random(-PI*.01, PI*.01), random(-PI*.001, PI*.001));
    dArr.array.add(d);
    /*
    // uncomment this for double sprout
    newSpeed.rotate(-PI*0.5);
    d = new Dot(pos.copy().add(newSpeed), newSpeed, random(-PI*.01, PI*.01), random(-PI*.001, PI*.001));
    dArr.array.add(d);
    */
  }

  void move() {
    speed.rotate(angle);
    pos=pos.add(speed);
    wrap();
    angle+=angInc;
  }

  void wrap() {
    if (pos.x > width) pos.x = 1;
    if (pos.x<0) pos.x = width-1;
    if (pos.y>height) pos.y = 1;
    if (pos.y<0) pos.y = height-1;
  }

  void check() {
    color cTemp = readCol(int(pos.x), int(pos.y));
    if (cTemp == dotCol|| life<=0) alive=false;
  }


  void display2() {
    stroke(dotCol);
    strokeWeight(5);
    point(pos.x, pos.y);
  }
  void display() {
    stroke(dotCol);
    float w = map(life, 0, 1, 1, 5);
    strokeWeight(w);
    point(pos.x, pos.y);
  }

  color readCol(int x, int y) {
    color c = pixels[y*width+x];
    float r, g, b;
    r = (c >> 16) & 0xff;
    g = (c >> 8) & 0xff;
    b = c & 0xff;
    return color(r, g, b);
  }
}