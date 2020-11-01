float posX, posY;
float radiusX, radiusY;
float theta;

void setup() {
  size( 200, 200 );
  
  posX =posY = 0;
  
  radiusX = 50;
  radiusY = 50;
  
  theta = 0;
}

void draw() { 
  background( 0 );
  
  theta += 0.01;
  
  posX = radiusX * cos( theta );
  posY = radiusY * sin( theta );
  
  translate( width / 2, height / 2 );
  fill( 255 );
  ellipse( posX, posY, 5, 5 );
}
