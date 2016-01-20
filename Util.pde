public float round(float value, int place){
  float output = (float)(value * Math.pow(10,place));
  output = Math.round(output);
  output /= Math.pow(10,place);
  return output;
}