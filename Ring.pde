public class Ring{
  float radius;
  
  int numBeats;
  ArrayList<Beat> beats;
  
  public Ring(float radius){
    this.radius = radius;
    numBeats = 0;
  }
  
  public Ring(int numBeats){
    this.numBeats = numBeats;
  }
  public Ring(float radius, int numBeats){
    this.radius = radius;
    this.numBeats = numBeats;
    beats = new ArrayList<Beat>();
    defaultBeatDistribution();
  }
  
  public void defaultBeatDistribution(){
    for(int ii=0;ii<numBeats;ii++){
      beats.add(new Beat(radius * cos(TWO_PI / numBeats * ii) + width/2, 
                         radius * sin(TWO_PI / numBeats * ii) + height/2, 
                         TWO_PI / numBeats * ii,
                         defaultBeatSize));
    }
  }
  
  
  public ArrayList<Beat> getBeats(){
    return beats;
  }
  public void draw(){
    ellipse(width/2, height/2, radius*2, radius*2);
    for(Beat b : beats){
      b.draw();
    }
  }
}//eo Ring