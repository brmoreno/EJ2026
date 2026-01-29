float x[] = new float[200];
float y[] = new float[200];
float t[] = new float[200];
float dx[] = new float[200];
float dy[] = new float[200];
color relleno [] = new color[200];

void setup(){
  size(600,600);
  background(255);
  for(int i = 0; i<200; i++){
    relleno[i] = color(random(255),random(255),random(255));
    x[i] = width/2;
    y[i] = height/2;
    t[i] = random(50,100);
    dx[i] = random(-2,2);
    dy[i] = random(-2,2);
  }
}


void draw(){
  background(255);
  for(int i=0; i<200;i++){
    noStroke();
    fill(relleno[i]);
    circle(x[i],y[i],t[i]);
    
    x[i]+= dx[i];
    y[i]+= dy[i];
    
   if(x[i] >= width-t[i]/2){
     dx[i]*=-1;
   }
   if(x[i] <= 0+t[i]/2){
     dx[i]*=-1;
   }   
   if(y[i]>height-t[i]/2){
     dy[i]*=-1;
   }
   if(y[i]<=0+t[i]/2){
      dy[i]*=-1;
   }
  }
}
