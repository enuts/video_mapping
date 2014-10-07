import ddf.minim.*;
 
float x;
float y;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
PImage bich; 
Minim minim;
AudioInput input;
 
void setup () {
  // Sketch einstellen
  size (1280, 800);
  smooth();
  stroke (0, 50);
  //noFill ();
  
  bich = loadImage("bikette.png");
   
  // Startposition festlegen
  x = width/2;
  y = height/2;
  
  x1 = width/2;
  y1 = height/2;
  
  x2 = width/2;
  y2 = height/2;
  
  x3 = width/2;
  y3 = height/2;
   
  // Audiotoolkit anlegen
  minim = new Minim (this);
  input = minim.getLineIn (Minim.STEREO, 512);
  background (0);
}
 
void draw () {
  // KreisgrÃ¶ÃŸe AbhÃ¤ngig von LautstÃ¤rke
  fill( random(255), random(255), random(255));
  float dim = input.mix.level ()*500 ;
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
  
  image(bich, width/2-input.mix.level ()*5000, height/2-input.mix.level ()*5000,input.mix.level ()*5000,input.mix.level ()*5000);
  
  
   
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
