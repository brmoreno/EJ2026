void setup(){
  size(800,800);
}

float ventana =0.005;
float dx;
float dzR;
float dzG;
float dzB;
void draw(){
  dx+=0.01;
  dzR+=0.01;
  dzG+=0.013;
  dzB-=0.01;
  for(int i = 0; i<width; i+=10){
    for(int j = 0; j<height; j+=10){
      float r = (noise(i*ventana+dx,j*ventana,dzR)*300);
      float g = (noise(i*ventana+6+dx,j*ventana+3,dzG)*300);
      float b = (noise(i*ventana-7+dx,j*ventana-2,dzB)*300);
      fill(r,g,b);
      noStroke();
      rect(i,j,10,10);
    }
  }
}
