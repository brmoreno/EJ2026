class Enemigo{
  //atributos
  float x,y;
  float t;
  color c;
  int comportamiento; // 0:estatico, 1: aleatorio, 2:constante. 
  float dx;
  float dy;
  
  
  //constructor
  Enemigo(float x_, float y_, float t_, int comp_){
    x = x_;
    y = y_;
    t = t_;
    c = color(0,0,255);
    comportamiento = comp_;
    float a = random(TWO_PI);
    dx = cos(a)*2;
    dy = sin(a)*2;
  }
  
  //métodos
  void display(){
    noStroke();
    fill(c);
    circle(x,y,t);
  }
  
  void moverse(){
    switch(comportamiento){
      case 0:
        estatico();
      break;
      case 1:
        aleatorio();
      break;
      case 2:
        constante();
      break;
    }   
  }
  
  void estatico(){
  }
  
  void aleatorio(){
    x+= random(-2,2);
    y+= random(-2,2);
    x = constrain(x,t/2,width-t/2);
    y = constrain(y,t/2,height-t/2);
  }
  
  void constante(){
    x+=dx;
    y+=dy;
    if(x<t/2 || x>width-t/2){
      dx*=-1;
    }
    if(y<t/2 || y>height-t/2){
      dy*=-1;
    }
  }  
}

Enemigo uno;
ArrayList <Enemigo> enemigos;

void setup(){
  size(800,800);
  uno = new Enemigo(width/2,height/2,200,2);
  enemigos = new ArrayList <Enemigo>();
  
}


void draw(){
  background(255);
  uno.display();
  uno.moverse();
  
  for(int i = 0; i<enemigos.size(); i++){
    enemigos.get(i).display();
    enemigos.get(i).moverse();
  }
}

void mousePressed(){
  Enemigo e = new Enemigo(mouseX,mouseY,random(50,100),2);
  enemigos.add(e);
}

void keyPressed(){
  if(enemigos.size()>0){
  enemigos.remove(enemigos.size()-1);
  }
}
