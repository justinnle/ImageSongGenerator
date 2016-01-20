import ddf.minim.*;
boolean debug;

Minim minim;
Clock clock;
float defaultBeatSize;
float needleInc; //time

color drawColor;

public void setup(){
  size(300,300);
  debug = true;
  minim = new Minim(this);
  defaultBeatSize = 10;
  clock = new Clock();
  clock.addRing(new Ring(50,3));
  needleInc = TWO_PI/360;
  drawColor = color(255,255,255);
}

public void draw(){
  background(155);
  println(clock.needle);
  clock.incNeedle(needleInc);
  clock.check();
  clock.draw();
}

public void keyPressed(){
  if(debug){
    if(key == 'd'){
    }
  }
}