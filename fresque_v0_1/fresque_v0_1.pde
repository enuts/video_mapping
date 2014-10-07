import krister.Ess.*;


// Variables globales /////////////////////////////////////
FFT myfft;
AudioInput myinput;
float fBufferSize=8;
int iLargeur = 1280;
int iHauteur = 600;
//Couleurs
color cCiel = #69baff;
color cPelouse1 = #03af3d;
color cPelouse2 = #00872b;
color cRoute = #787878;
color cSoleil = #edff21;
//variable aller arbre
int iDebArbreGauche;
int iDebArbreDroite;
int iFinArbreGauche;
int iFinArbreDroite;
int iDistArbreX;
int iDistArbreY;

// Setup //////////////////////////////////////////////////
void setup() {
  size(iLargeur,iHauteur);
  frameRate(15);
  background(0);

  Ess.start(this);
  myinput=new AudioInput((int)fBufferSize);
  myfft=new FFT((int)fBufferSize*2);
  myinput.start();

  myfft.damp(.3);
  myfft.equalizer(true);
  myfft.limits(.005,.05);
  
  //init variables
  iDebArbreGauche = (int)(width*0.3);
  iDebArbreDroite = width - (int)(width*0.3);
  iFinArbreGauche = width/2 - 40;
  iFinArbreDroite = width/2 + 40;
  iDistArbreX = (int)abs((iDebArbreGauche-iFinArbreGauche)/fBufferSize);
  iDistArbreY = (int)abs(height*0.604/fBufferSize);

   
}


// draw ///////////////////////////////////////////////////
void draw() {
 
  dessinerArrierePlan();
  dessinerSoleil();
  dessinerArbres();
  
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}

public void dessinerArrierePlan(){
  //Ciel
  beginShape();
  fill(cCiel);
  vertex(0, 0);
  vertex(0, height);
  vertex(width, height);
  vertex(width, 0);
  endShape();
  
  //colline gauche
  beginShape();
  fill(cPelouse2);
  noStroke();
  vertex(-width/6,2*height/3);
  bezierVertex(-0.3*width/6, height*0.35, 1.3*width/6, height*0.35, 2.2*width/6, height*0.7 );
  endShape();
    
  //colline droite
  beginShape();
  fill(cPelouse2);
  noStroke();
  vertex(width+width/6,2*height/3);
  bezierVertex(width+0.53*width/6, height*0.25, width-1.5*width/6, height*0.25, width-3*width/6, height*0.7 );
  endShape();
  
  //colline principale
  beginShape();
  fill(cPelouse1);
  noStroke();
  vertex(0, 2*height/3);
  bezierVertex(width/3, height*0.58, 2*width/3, height*0.58, width, 2*height/3 );
  vertex(width, height);
  vertex(0, height);
  endShape();
  
  //Route
  beginShape();
  noStroke();
  fill(cRoute);
  vertex(width*0.33, height);
  vertex(width-width*0.33, height);
  vertex(width/2+15, height*0.602);
  vertex(width/2-15, height*0.602);
  endShape();
  
}

public void dessinerArbres()
{
  
  for (int i=0; i<(int)fBufferSize;i++) {
    
    /*fill(146,116,53);
    rect(width-i*20-myfft.spectrum[i]*-50-width/2,5*i+height-height/4+myfft.spectrum[i]*-600,myfft.spectrum[i]*-100,-myfft.spectrum[i]*-600);
    rect(width/2+i*20-myfft.spectrum[i]*-50,5*i+height-height/4+myfft.spectrum[i]*-600,myfft.spectrum[i]*-100,-myfft.spectrum[i]*-600);
    
    fill(0,50+i/fBufferSize*255,0);
    ellipse(width/2+i*20,5*i+height-height/4+myfft.spectrum[i]*-600,myfft.spectrum[i]*-350,myfft.spectrum[i]*-400);
    ellipse(width-i*20-width/2,5*i+height-height/4+myfft.spectrum[i]*-600,myfft.spectrum[i]*-350,myfft.spectrum[i]*-400);*/
    
    fill(146,116,53);
    rect(iDebArbreGauche+i*iDistArbreX-5,
         height-i*iDistArbreY-100,
         -10,
         -100);
         //println(iDebArbreGauche+i*iDistArbreX);
    rect(width/2+i*20-myfft.spectrum[i]*-50,
         5*i+height-height/4+myfft.spectrum[i]*-600,
         myfft.spectrum[i]*-100,
         -myfft.spectrum[i]*-600);
    
    fill(0,50+i/fBufferSize*255,0);
    ellipse(width/2+i*20,
            5*i+height-height/4+myfft.spectrum[i]*-600,
            myfft.spectrum[i]*-350,
            myfft.spectrum[i]*-400);
    ellipse(width-i*20-width/2,
            5*i+height-height/4+myfft.spectrum[i]*-600,
            myfft.spectrum[i]*-350,
            myfft.spectrum[i]*-400);
    
   
  }
}

public void dessinerSoleil(){
  noStroke();
  fill(cSoleil);
  ellipse(100,100,100+myfft.spectrum[5]*-600,100+myfft.spectrum[5]*-600); 
}

