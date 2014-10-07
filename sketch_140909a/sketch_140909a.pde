import krister.Ess.*;

FFT myfft;
AudioInput myinput;
float bufferSize=32;

void setup() {
  size(40*(int)bufferSize,600);
  frameRate(10);
  background(0);
  //noStroke();
  fill(255);

  Ess.start(this);
  myinput=new AudioInput((int)bufferSize);
  myfft=new FFT((int)bufferSize*2);
  myinput.start();

  myfft.damp(.3);
  myfft.equalizer(true);
  myfft.limits(.005,.05);
}

void draw() {
  fill(0,0,0,10);
  rect(0,0,width,height);
  
  for (int i=0; i<bufferSize;i++) {
    
    fill(146,116,53);
    rect(width-i*20-myfft.spectrum[i]*-50-width/2,5*i+height-height/4+myfft.spectrum[i]*-600,myfft.spectrum[i]*-100,-myfft.spectrum[i]*-600);
    rect(width/2+i*20-myfft.spectrum[i]*-50,5*i+height-height/4+myfft.spectrum[i]*-600,myfft.spectrum[i]*-100,-myfft.spectrum[i]*-600);
    
    fill(0,50+i/bufferSize*255,0);
    ellipse(width/2+i*20,5*i+height-height/4+myfft.spectrum[i]*-600,myfft.spectrum[i]*-350,myfft.spectrum[i]*-400);
    ellipse(width-i*20-width/2,5*i+height-height/4+myfft.spectrum[i]*-600,myfft.spectrum[i]*-350,myfft.spectrum[i]*-400);
    
   
  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}
