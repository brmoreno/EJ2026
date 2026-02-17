class Particula {
  //atributos
  float x;
  float y;
  float t;
  color c;
  float dx;
  float dy;

  //constructor
  Particula() {
    x = width/2;
    y = height/2;
    t = random(50, 100);
    c = color(random(255), random(255), random(255));
    dx = random(-2, 2);
    dy = random(-2, 2);
  }

  //métodos
  void display() {
    noStroke();
    fill(c);
    circle(x, y, t);
  }

  void mover() {
    x+=dx;
    y+=dy;
    if (x<t/2) {
      dx = abs(dx);
    }
    if (x>width-t/2) {
      dx = -abs(dx);
    }
    if (y<t/2) {
      dy = abs(dy);
    }
    if (y>height-t/2) {
      dy = -abs(dy);
    }
  }
}

Particula una;
Particula otra;

void setup(){
  size(500,500);
  una = new Particula();
  otra = new Particula();
}

void draw(){
  background(255);
  una.display();
  una.mover();
  otra.display();
  otra.mover();
}
