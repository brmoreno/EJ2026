class Particula{
  PVector pos;
  PVector vel;
  float tam;
  color c;
  float dt;
  float dr;
  
  Particula(int x_, int y_){
    pos = new PVector(x_, y_);
    vel = PVector.random2D();
    tam = random(20,40);
    c = gato.get(x_,y_);
    dt = random(0.25,1);
    dr = random(-0.01,0.01);
  }
  
  void display(){
    if(tam>0){
      noStroke();
      color c2 = gato.get(round(pos.x),round(pos.y));
      c = lerpColor(c,c2,0.05);
      fill(c);
      circle(pos.x,pos.y,tam);
      tam-=dt;
      pos.add(vel);
      vel.rotate(dr);
    }
  }
  
}


PImage gato;

ArrayList <Particula> particulas;

void setup(){
    size(600,800);
    gato = loadImage("croqueta.png");  
    particulas = new ArrayList <Particula>();
    for(int i = 0; i<1200;i++){
      particulas.add(new Particula(round(random(width)),round(random(height))));
    }
}

void draw(){
  //int x = floor(random(width));
  //int y = floor(random(height));
  //int w = floor(random(100, 200));
  //int h = floor(random(20,60));
  //PImage recorte = gato.get(x,y,w,h);
  //if(random(1)<0.1){
  //tint(random(255),random(255),random(255));
  //}
  //image(recorte, x+random(-50,50),y+random(-50,50));
  //noTint();
 
  //gato.loadPixels();
  //for(int i = 0; i<gato.width; i+=10){
  //  for(int j = 0; j<gato.height; j+=10){
  //    int v = i+j*gato.width;
  //    color c = gato.pixels[v];
  //    strokeWeight(random(7));
  //    stroke(c);
  //    line(i,j,i+random(-100,100),j+random(-100,100));
  //  }
  //} 
  
  for(Particula p: particulas){
    p.display();
  } 
}

void keyPressed(){
  saveFrame("foo.png");
}

void mousePressed(){
  Particula p= new Particula(mouseX,mouseY);
  particulas.add(p);
}
