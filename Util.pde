public float round(float value, int place){
  float output = (float)(value * Math.pow(10,place));
  output = (float)(Math.round(output));
  output /= Math.pow(10,place);
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