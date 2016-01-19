import ddf.minim.*;
boolean debug;

Minim minim;
Clock clock;
float defaultBeatSize;

public void setup(){
  size(300,300);
  debug = true;
  minim = new Minim(this);
  defaultBeatSize = 10;
  clock = new Clock();
  clock.addRing(new Ring(50,3));
}

public void draw(){
  background(155);
  clock.incNeedle(TWO_PI/360);
  clock.draw();
}

public void keyPressed(){
  if(debug){
    if(key == 'd'){
    }
  }
}