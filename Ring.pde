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
      float rad = TWO_PI /numBeats * ii;
      beats.add(new Beat(radius * cos(rad) + width/2, //x
                         radius * sin(rad) + height/2, //x
                         round(rad,2),//radian rounded to 10
                         defaultBeatSize));//radius
      beats.get(ii).setColor(color(255,255,255));                         
                         
    }//eo for
  }//eo defaultBeatDistribution
  
  
  public ArrayList<Beat> getBeats(){
    return beats;
  }
  
  public void check(float radian){
    for(Beat b : beats){
      b.check(radian);
    }
  }
  public void draw(){
    ellipse(width/2, height/2, radius*2, radius*2);
    for(Beat b : beats){
      b.draw();
    }
  }
}//eo Ring