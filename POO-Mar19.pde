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

class Juego {
  Nivel n;
  int estado; //0:inicio, 1:nivel, 2:gané, 3: perdí, 4: fin de Niveles, 5: game over!
  int vidas;
  int nivelActual;
  int nivelMaximo = 5;
  
  Juego(){
    estado = 0;
    vidas = 3;
    nivelActual = 1;
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo>();
    enemigos.add(new Enemigo(600,600,150,0));
    n = new Nivel(2,100,100,enemigos);
  }
  
  void display(){
    switch(estado){
      case 0:
        inicio();
      break;
      case 1:
        mostrarNivel();
      break;  
      case 2:
        gane();
      break;
      case 3:
        perdi();
      break;
      case 4:
        finDeNiveles();
      break;
      case 5:
        gameOver();
      break;
    }
  }
  
  void control(){
    switch(estado){
      case 0:
        estado = 1;
      break;
      case 2:
        nivelActual++;
       
        if(nivelActual < nivelMaximo){
           contruirNivel();
          estado = 1;
        }
        else{
          estado = 4;
        }
      break;
      case 3:
        vidas--;
        
        if(vidas >= 0){
          contruirNivel();
          estado = 1;
        }
        else{
          estado = 5;
        }
      break;
      case 4:
        vidas = 3;
        nivelActual = 1;
        estado = 0;
        contruirNivel();
      break;
      case 5:
        contruirNivel();
         vidas = 3;
        nivelActual = 1;
        estado = 0;
      break;
      
    }
  }
  
  
  void contruirNivel(){
    ArrayList <Enemigo> enemigos = new ArrayList <Enemigo>();
    enemigos.add(new Enemigo(600,600,150,0));
    Nivel actual = new Nivel(2,100,100,enemigos);
    switch(nivelActual){
      case 2:
      enemigos.add(new Enemigo(100,600,150,1));
      actual = new Nivel(2,100,100,enemigos);
      break;
      case 3:
      enemigos.add(new Enemigo(100,600,150,1));
      enemigos.add(new Enemigo(600,100,150,1));
      actual = new Nivel(2,100,100,enemigos);
      break;
      case 4:
         enemigos.add(new Enemigo(100,600,150,2));
        enemigos.add(new Enemigo(600,100,150,2));
      actual = new Nivel(2,100,100,enemigos);
      break;
    }
    n = actual;
  }
  
  void inicio(){
    background(255);
  }
  
  void mostrarNivel(){
    background(255);
    n.funcionalidad();
    if(n.estado == 1){
      estado = 2;
    }
    if(n.estado == 2){
      estado = 3;
    }
  }
   
  void gane(){
    background(0,255,0);
  }
   
  void perdi(){
    background(255,0,0);
  }
  
  void  finDeNiveles(){
    background(0,0,255);
  }
  
  void gameOver(){
     background(0);
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


Juego miJuego;

void setup(){
  size(800,800);
  miJuego = new Juego();
  
}

void draw(){
  miJuego.display();
  
}

void keyPressed(){
  miJuego.control();
}
