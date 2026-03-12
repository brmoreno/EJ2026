class Nivel{
  
  Jugador elJugador;
  Item elItem; 
  ArrayList <Enemigo> enemigos;
  
  int estado = 0; //0: sigo jugando, 1: gané , 2: perdí;
  
  Nivel(float v_, float xi_, float yi_, ArrayList <Enemigo> enemigos_){
    elJugador = new Jugador(v_);
    elItem = new Item(xi_, yi_);
    enemigos = enemigos_;   
  }
    
  void funcionalidad(){
    elJugador.display();
    elJugador.moverse();
    elItem.display();   
    if(elJugador.captura(elItem)){
      estado = 1;
    }     
    for(Enemigo e:enemigos){
      FuncionEnemigo(e);
    }
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


Nivel n;

void setup(){
  size(800,800);
  Enemigo uno = new Enemigo(100,100,80,1);
  Enemigo dos = new Enemigo(100,700,80,2);
  Enemigo tres = new Enemigo(700,100,80,2);
  ArrayList <Enemigo> enemigos = new ArrayList <Enemigo>();
  enemigos.add(uno);
  enemigos.add(dos);
  enemigos.add(tres);
   enemigos.add(new Enemigo(700,700,80,2));
  n = new Nivel(2,700,700,enemigos);
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

