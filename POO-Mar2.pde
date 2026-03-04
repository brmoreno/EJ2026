class Jugador{
  //atributos
  float x, y;
  float t;
  color c;
  float v;
  float a; 
  
  
  //constructor
  Jugador(float v_){
    x = width/2;
    y = height/2;
    t = 100;
    c = color(255,0,0);
    v = v_;
    a = -HALF_PI; //hacia arriba;
  }
  
  //métodos
  void display(){
    noStroke();
    fill(c);
    circle(x,y,t);
  }
  
  void moverse(){
    float dx = cos(a)*v;
    float dy = sin(a)*v;
    x+=dx;
    y+=dy;
    if(keyPressed){
      if(key == 'a'){
        a-= 0.05;
      }
      if(key == 'd'){
        a+= 0.05;
      }
    }
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void colision(){
  }
  
  void captura(){
  }
  
}

class Item{
  //atributos
  float t;
  color c;
  float x,y;
  
  //constructor
  Item(float x_, float y_){
    x = x_;
    y = y_;
    t = 30;
    c = color(0,255,0);
  }
  
  //métodos
  void display(){
    noStroke();
    fill(c);
    circle(x,y,t);
  }
}


class Enemigo{
  //atributos
  float x,y;
  float t;
  color c;
  int comportamiento; // 0:estatico, 1: aleatorio, 2:constante.  
  
  //constructor
  Enemigo(float x_, float y_, float t_, int comp_){
    x = x_;
    y = y_;
    t = t_;
    c = color(0,0,255);
    comportamiento = comp_;
  }
  
  //métodos
  void display(){
    noStroke();
    fill(c);
    circle(x,y,t);
  }
  
  void moverse(){
  }
}

//Jugador el circulo rojo de 100 px;
//Item: el circulo verde ;
//Enemigos  circulos azules; 

// Jugador e Item captura.  
// Jugador Enemigo  Colisión 

Jugador elJugador;
Item elItem;
Enemigo uno;
Enemigo dos;

void setup(){
  size(800,800);
  elJugador = new Jugador(2);
  elItem = new Item(100,100);
  uno = new Enemigo(400,100,120,0);
  dos = new Enemigo(100,400,80,1);
}

void draw(){
  background(255);
  elJugador.display();
  elJugador.moverse();
  elItem.display();
  uno.display();
  dos.display();
}



