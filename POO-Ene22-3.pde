size(800,800);

color fondo = color(random(255),random(255),random(255));
color relleno = color(random(255),random(255),random(255));;
int x = floor(random(800));
float y = random(800);
int t = round(random(200,600));

background(fondo);
fill(relleno);
noStroke();
circle(x,y,t);
