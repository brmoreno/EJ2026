class Rectangulo{
  // Atributos;
  int ancho;
  int alto;
  int x;
  int y;
  color c;
  boolean borde;
  
  //Constructor
  Rectangulo(int x_, int y_, int w_, int h_){
    x = x_;
    y = y_;
    ancho = w_;
    alto = h_;
    c = color(random(255),random(255),random(255));
    borde = random(1)<0.5;
  }
  
  Rectangulo(int x_, int y_, int l_){
    x= x_;
    y = y_;
    ancho = alto = l_;
    c = color(255,0,0);
    borde = random(1)<0.5;
  }
   
  //Métodos
  void display(){
    if(borde){
      stroke(0);
    }
    fill(c);
    rect(x,y,ancho,alto);
  }
  
  float area(){
    return alto*ancho;
  }
}



class Perro {
  int x;
  int y;
  color c;
  float r;

  Perro(int x_, int y_, color c_, float r_) {
    x = x_;
    y = y_;
    c = c_;
    r = r_;
  }

  void display() {
    perro(x, y, c, r);
  }

  void perro(int x_, int y_, color c1_, float rota_) {
    pushMatrix();
    translate(x_, y_);
    rotate(rota_);
    noStroke();

    fill(0, 40);
    ellipse(0, 30, 70, 20);

    fill(c1_);
    ellipse(0, 0, 85, 55);

    fill(220, 190, 160);
    ellipse(10, 10, 40, 30);

    fill(c1_);
    ellipse(45, -25, 55, 45);

    fill(red(c1_)-20, green(c1_)-20, blue(c1_)-20);
    ellipse(25, -55, 20, 35);
    ellipse(65, -55, 20, 35);

    fill(240, 210, 180);
    ellipse(55, -15, 25, 18);

    fill(0);
    ellipse(60, -18, 8, 6);

    fill(255);
    ellipse(45, -30, 12, 12);
    fill(0);
    ellipse(47, -30, 6, 6);

    fill(255);
    ellipse(60, -30, 12, 12);
    fill(0);
    ellipse(62, -30, 6, 6);

    fill(red(c1_)-10, green(c1_)-10, blue(c1_)-10);
    ellipse(-20, 25, 20, 30);
    ellipse(10, 25, 20, 30);

    fill(c1_);
    ellipse(-45, -10, 30, 15);

    popMatrix();
  }
}



Rectangulo miRect; 
Perro uno;
Perro otro;

void setup(){
  size(500,500);
  miRect = new Rectangulo(100,100,200);
  uno = new Perro(200,200,color(0),0);
  otro = new Perro(300,100,color(255,0,0),HALF_PI);
}


void draw(){
  background(255);
  miRect.display();
  uno.display();
  otro.display();
}

void keyPressed(){
  println(miRect.area());
}

