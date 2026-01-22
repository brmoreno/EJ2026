// variables globales
color fondo;
color relleno;
int x;
int y;
int tam;
float t = 0;
float dt = 0.005;

float rojo;
float azul;
float verde;
float dr;
float dv;
float da;

//unicamente en el inicio del programa, condiciones de arranque
void setup(){
  size(800,800);
  fondo = color(255);
  relleno = color(255,45,60);
  x = 0;
  y = 400;
  tam = 600;
  rojo = random(7);
  azul = random(7);
  verde = random(7);
  dr = random(0.1);
  dv = random(0.1);
  da = random(0.1);
  background(fondo);
}

//una y otra vez a 20ms
void draw(){
  t+=dt;
  rojo += dr;
  verde += dv;
  azul += da;
  float funSin = sin(t);
  float colorR = map(sin(rojo),-1,1,0,255);
  float colorG = map(sin(verde),-1,1,0,255);
  float colorB = map(sin(azul),-1,1,0,255);
  
   noStroke();
   fill(colorR,colorG,colorB);
   ellipse(x,y,100,tam*funSin);
   x+=1;
   x%=800;
   
}
