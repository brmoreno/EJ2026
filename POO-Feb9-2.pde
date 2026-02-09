int px, py;
float pr;

void setup(){
  size(500,500);
  px = 300;
  py = 300;
}

void draw(){
  pr+=0.01;
  background(255);
  gato(mouseX,mouseY, color(180) ,0 );
  gato(px,py, color(255,255,0),pr);

  if(keyPressed){
    if(key == 'a'){
      px-=2;
    }
    if(key == 's'){
      px+=2;
    }
  }
}

void gato( int x_, int y_, color c1_, float rota_){
  pushMatrix();
  translate(x_,y_);
  rotate(rota_);
  scale(0.5);
  translate(-200,-200);
  noStroke();
  fill(c1_);
  ellipse(200,200,200,150);
  fill(0);
  ellipse(200,200,30,20);
  ellipse(170,170,15,15);
  ellipse(230,170,15,15);
  fill(c1_);
  triangle(125,151,121,81,182,128);
  triangle(226,129,265,83,279,175);
  for(int i = 0; i<3; i++){
    fill(0);
    rect(250,200+i*8,20,5);   
    rect(150,200+i*8,-20,5);
  }
  popMatrix();
}
