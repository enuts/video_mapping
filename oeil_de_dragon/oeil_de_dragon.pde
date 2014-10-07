import ddf.minim.*;
 
float x;
float y;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
Minim minim;
AudioInput input;
 
void setup () {
  // Sketch einstellen
  size (1280, 800);
  smooth();
  stroke (0, 50);
  //noFill ();
   
  // Startposition festlegen
  x = 0;
  y = 0;
  
  x1 = 0;
  y1 = height;
  
  x2 = width;
  y2 = height;
  
  x3 = width;
  y3 = 0;
   
  // Audiotoolkit anlegen
  minim = new Minim (this);
  input = minim.getLineIn (Minim.STEREO, 512);
  background (0);
}
 
void draw () {
  // KreisgrÃ¶ÃŸe AbhÃ¤ngig von LautstÃ¤rke
  fill( random(255), random(255), random(255), random(255));
  float dim = input.mix.level ()*250 ;
  // Kreis x-Position verschieben
  x += random(input.mix.level ()*5000)/25 -random(input.mix.level ()*5000)/25;
  y += random(input.mix.level ()*5000)/25 - random(input.mix.level ()*5000)/25;
  
  x1 += random(input.mix.level ()*5000)/25 -random(input.mix.level ()*5000)/25;
  y1 += random(input.mix.level ()*5000)/25 - random(input.mix.level ()*5000)/25;
  
  x2 += random(input.mix.level ()*5000)/25 -random(input.mix.level ()*5000)/25;
  y2 += random(input.mix.level ()*5000)/25 - random(input.mix.level ()*5000)/25;
  
  x3 += random(input.mix.level ()*5000)/25 -random(input.mix.level ()*5000)/25;
  y3 += random(input.mix.level ()*5000)/25 - random(input.mix.level ()*5000)/25;
  
  ellipse (x, y, dim, dim);
  ellipse (x1, y1, dim, dim);
  ellipse (x2, y2, dim, dim);
  ellipse (x3, y3, dim, dim);
  
  
   
  if (x > width) {
    x = 0;
    
  }
  
  if (y > height) {
    y = 0;
    
  }
  
  if (x < 0) {
    x = width;
    
  }
  
  if (y < 0) {
    y = height;
  }
  
  if (x1 > width) {
    x1 = 0;
    
  }
  
  if (y1 > height) {
    y1 = 0;
    
  }
  
  if (x1 < 0) {
    x1 = width;
    
  }
  
  if (y1 < 0) {
    y1 = height;
  }
  
  if (x2 > width) {
    x2 = 0;
    
  }
  
  if (y2 > height) {
    y2 = 0;
    
  }
  
  if (x2 < 0) {
    x2 = width;
    
  }
  
  if (y2 < 0) {
    y2 = height;
  }
  
  if (x3 > width) {
    x3 = 0;
    
  }
  
  if (y3 > height) {
    y3 = 0;
    
  }
  
  if (x3 < 0) {
    x3 = width;
    
  }
  
  if (y3 < 0) {
    y3 = height;
  }
}
