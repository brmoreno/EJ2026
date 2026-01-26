// variables globales
color fondo;
color relleno;
float x;
float y;
int t;
int dx;
float dy;

float x2;
float y2;
float t2;
color relleno2;

float x3;
float y3;
float t3;
color relleno3;

//unicamente en el inicio del programa, condiciones de arranque
void setup(){
  size(800,800);
  fondo = color(255);
  relleno = color(255,45,60);
  x = 400;
  y = 400;
  t = 300;
  dx = 3;
  dy = 1.5;
  
  x2 = 100;
  y2 = 100;
  t2 = 200;
  relleno2 = color(120,30,255);
  
  x3 = width/2;
  y3 = height/2;
  t3 = 200;
  relleno3 = color(255,255,0);
  
}

//una y otra vez a 20ms
void draw(){
  background(fondo);
   noStroke();
   
   fill(relleno);
   circle(x,y,t);
   x+= dx;
   y+= dy;
   if(x >= width-t/2){
     dx*=-1;
   }
   if(x <= 0+t/2){
     dx*=-1;
   }   
   if(y>height-t/2){
     dy*=-1;
   }
   if(y<=0+t/2){
      dy*=-1;
   }
   
   fill(relleno2);
   x2 = mouseX;
   y2 = mouseY;
   if(mousePressed){
     relleno2 = color(random(255),random(255),random(255));
   }
   circle(x2,y2,t2);
   
   
   if(keyPressed){
     switch(key){
       case 'a':
         x3--;
       break;
       case 'd':
         x3++;
       break;      
     }
   }
   fill(relleno3);
   circle(x3,y3,t3);
   
}
