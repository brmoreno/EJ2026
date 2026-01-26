// variables globales
color fondo;
color relleno;
int x;
int y;
int t;

//unicamente en el inicio del programa, condiciones de arranque
void setup(){
  size(800,800);
  fondo = color(255);
  relleno = color(255,45,60);
  x = 100;
  y = 400;
  t = 300;
  
}

//una y otra vez a 20ms
void draw(){
  background(fondo);
   noStroke();
   fill(relleno);
   circle(x,y,t);
   x+=1;
   if( x == 650){
     println("llegó al límite");
   }  
}
