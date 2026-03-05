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
  
  boolean colision( Enemigo e_ ){
    boolean colisiona = false;
    float sumaRadios = this.t/2 + e_.t/2;
    float distancia = dist(this.x,this.y, e_.x,e_.y);
    if(sumaRadios>distancia){
      colisiona = true;
    }   
    return colisiona;
  }
  
  boolean captura(Item i_){
    boolean colisiona = false;
    float sumaRadios = this.t/2 + i_.t/2;
    float distancia = dist(this.x,this.y, i_.x,i_.y);
    if(sumaRadios>distancia){
      colisiona = true;
    }   
    return colisiona;
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


class Nivel{
  
  Jugador elJugador;
  Item elItem;
  
  Enemigo uno;
  Enemigo dos;
  Enemigo tres;
  Enemigo cuatro;
  
  int estado = 0; //0: sigo jugando, 1: gané , 2: perdí;
  
  Nivel(float v_, float xi_, float yi_, Enemigo uno_){
    elJugador = new Jugador(v_);
    elItem = new Item(xi_, yi_);
    uno = uno_;   
  }
  
  Nivel(float v_, float xi_, float yi_, Enemigo uno_, Enemigo dos_){
    elJugador = new Jugador(v_);
    elItem = new Item(xi_, yi_);
    uno = uno_; 
    dos  = dos_;
  }
  
  Nivel(float v_, float xi_, float yi_, Enemigo uno_, Enemigo dos_, Enemigo tres_){
    elJugador = new Jugador(v_);
    elItem = new Item(xi_, yi_);
    uno = uno_; 
    dos  = dos_;
    tres = tres_;
  }
  
  void funcionalidad(){
    elJugador.display();
    elJugador.moverse();
    elItem.display();   
    if(elJugador.captura(elItem)){
      estado = 1;
    }    
    FuncionEnemigo(uno);
    FuncionEnemigo(dos);
    FuncionEnemigo(tres);
  } 
  
  void FuncionEnemigo( Enemigo e_){
    if(e_ != null){
      e_.display();
      e_.moverse();
      if(elJugador.colision(e_)){
        estado = 2;
      }
    }
  }
}


Nivel n;

void setup(){
  size(800,800);
  Enemigo uno = new Enemigo(100,100,120,1);
  Enemigo dos = new Enemigo(100,700,150,1);
  Enemigo tres = new Enemigo(700,100,200,1);
  n = new Nivel(2,700,700,uno,dos, tres);
}

void draw(){
  
  background(255);
  n.funcionalidad();
  println(n.estado);
  if(n.estado== 1){
    background(0,255,0);
  }
  if(n.estado == 2){
    background(0);
  }
}
