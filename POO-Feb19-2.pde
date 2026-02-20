class Perro {
  int x;
  int y;
  color c;
  float contadorCola;
  boolean cola = true;
  float paso = 0;
  int direccion = 0;
  int fScala = 1;
  float r = 0;
  int pOrejas = 1;
  int cicloOrejas;
  float escala;
  int vel;

  Perro(int x_, int y_, color c_) {
    x = x_;
    y = y_;
    c = c_;
    escala = 1;
    vel = 5;
    idle();
  }  

  Perro(int x_, int y_, color c_, float escala_, int vel_) {
    x = x_;
    y = y_;
    c = c_;
    escala = escala_;
    vel = vel_;
    idle();
  }

  void cambioCola(){
    cola = !cola;
  }
  
  void cambioOrejas(){
    pOrejas++;
    pOrejas %=3;
  }
  void display() {
    switch(direccion){
      case 0:
      fScala = 1;
      r = 0;
      break;
      case 1:
      fScala = -1;
      r = 0;
      break;
      case 2:
      fScala = 1;
      r = -HALF_PI;
      break;
      case 3:
      fScala = 1;
      r = HALF_PI;
      break;
      
    }
    perro(x, y, c, r);
    if(cola){
      contadorCola+=0.25;
    }
  }
  
  void avanza(int dire_){
    cola = true;
    direccion = dire_;
    switch(dire_){
      case 0:
        x+=vel;
      break;
      case 1:
        x-=vel;
      break;
      case 2:
        y-=vel;
      break;
      case 3:
        y+=vel;
      break;
    }
    paso++;
    paso%= 3;    
    cicloOrejas++;    
    pOrejas =(cicloOrejas/2)%2;   
    
    x = constrain(x,floor(75*escala),width-floor(75*escala));
    y = constrain(y,floor(75*escala),height-floor(75*escala));
  }
  
  void idle(){
    pOrejas = 2;
    paso = 1;
    cola = false;
  }

  void perro(int x_, int y_, color c1_, float rota_) {
    pushMatrix();
    translate(x_, y_);
    scale(1*fScala*escala,1*escala);
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
    if(pOrejas== 0){
      ellipse(25, -55, 20, 35);
      ellipse(65, -55, 20, 35);
    }
     else if(pOrejas== 1){
      ellipse(25-17.5, -55+17.5, 35, 20);
      ellipse(65+17.5, -55+17.5, 35, 20);
    }
    else if(pOrejas== 2){
      ellipse(25, -55+35, 20, 35);
      ellipse(65, -55+35, 20, 35);
    }
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
    pushMatrix();
    translate(-20,25-15);
    rotate((paso-1)*.7);
    ellipse(0, +15, 20, 30);
    popMatrix();
    pushMatrix();
    translate(10,25-15);
    rotate(-(paso-1)*.7);
    ellipse(0, 15, 20, 30);
    popMatrix();
    fill(c1_);
    pushMatrix();
    translate(-45+22.5,-10);
    rotate(.5+sin(contadorCola)*0.25);
    ellipse(-22.5, 0, 30, 15);
    popMatrix();
    popMatrix();
  }  
}

Perro uno;
Perro otro;

void setup(){
  size(500,500);
  uno = new Perro(width/2,height/3*2,color(255,150,100),0.5,5);  
  otro = new Perro(width/4,height/2,color(90,90,120),2,5);  
}


void draw(){
  background(255);  
  otro.display();
  uno.display();
}

void keyPressed(){
  if(key == 'd'){
    uno.avanza(0);
  }
  if(key == 'a'){
    uno.avanza(1);
  }
  if(key == 'w'){
    uno.avanza(2);
  }
  if(key == 's'){
    uno.avanza(3);
  }
  otro.cola = true;
}

void keyReleased(){
  uno.idle();
  otro.cola = false;
  otro.cambioOrejas();
}
