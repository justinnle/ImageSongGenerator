int roundAccuracy = 3;
public float roundRadian(float value){
  float output = (float)(value * Math.pow(10,roundAccuracy));
  output = (float)(Math.round(output));
  output /= Math.pow(10,roundAccuracy);
  return output;
}

//calibrate processing's draw to real time for bpm and related things
boolean calibrateUpdateTimer;
float updateTimer;
float timerStart;
float timerEnd;
int calibrationTime;
public void calibrateUpdateTimer(int seconds){
  calibrateUpdateTimer = true;
  timerStart = second();
  timerEnd = -1; //just in case for printing stuffs
  updateTimer = 0;
  calibrationTime = seconds;
}

public float calculateBPM(){
  float output = 120;
  
  return 0;
}