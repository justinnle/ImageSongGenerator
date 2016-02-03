//sounds from http://sampleswap.org/filebrowser-new.php
import ddf.minim.*;
boolean debug;

Minim minim;
Clock clock;
float defaultBeatSize;

boolean playing;
float needleInc; //time
float processingTick; //time for processing to update
float bpm;

color drawColor;

public void setup(){
  size(300,300);
  debug = false;
  
  minim = new Minim(this);
  image = loadImage("images/aurora space dialogue.png");
  
  defaultBeatSize = 10;
  clock = new Clock(2,2);
  //clock.addRing(new Ring(40,4, "sounds/drums/kicks/808bd.aif"));
  
  //clock.addRing(new Ring(35,4));
  //clock.addRing(new Ring(70,8));
  //clock.toggleActive(1,1,3);
  needleInc = TWO_PI * processingTick;//TWO_PI/360 * 3;//radians moved
  print(needleInc);
  drawColor = color(255,255,255);
}

public void draw(){
  background(155);
  image(image,0,0,300,300);
  
  //calibrateBPM
  if(calibrateUpdateTimer){
    updateTimer += 1;
    if(timerEnd != second()){
      timerEnd = second();
      print((int)(timerEnd - timerStart));
      print(" ");
    }
    if(timerEnd - timerStart >= calibrationTime){
      calibrateUpdateTimer = false;
      processingTick = (timerEnd - timerStart) / updateTimer;
      needleInc = TWO_PI * processingTick;
      println("\nCalibration finished : " + processingTick + "s per processing tick ");
    }
  }
  if(playing && !calibrateUpdateTimer){
    clock.check();
    clock.incNeedle(needleInc);
  }
  clock.draw();
}

public void keyPressed(){
  if(debug){
    if(key == 'd'){
    }
  }
  if(key == 'c'){
    int calibrateTime = 10;
    calibrateUpdateTimer(calibrateTime);
    println("calibrating for " + calibrateTime + " seconds");
  }
  if(key == ' '){
    playing = !playing;
  }
}