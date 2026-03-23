String c = "foo bar baz qux,foo bar baz qux,foo bar baz qux";
PFont fuente1;
PFont fuente2;

void setup(){
  size(800,800);
  String [] nombres = PFont.list();
  println(nombres);
  fuente1 = createFont(nombres[round(random(10,200))],60); 
  fuente2 = loadFont("Verdana-BoldItalic-80.vlw");
}

void draw(){
  background(255);
  fill(255,0,0);
  textAlign(BASELINE,BASELINE);
  textLeading(100);
  textFont(fuente2);
  textSize(mouseX);
  text(c, 100,500);
  
}

void keyPressed(){
  if(key == 'a'){
    c = "otra cosa";
  }
  
  if(key == 's'){
    c = "foo bar baz ";
  }
}
