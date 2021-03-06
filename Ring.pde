public class Ring{
  float radius;
  float rotation;
  int numBeats;
  ArrayList<Beat> beats;
  
  public Ring(float radius){
    this.radius = radius;
    numBeats = 0;
  }
  
  public Ring(int numBeats){
    this.numBeats = numBeats;
  }
  
  public Ring(float radius, int numBeats, String sound){
    this.radius = radius;
    this.numBeats = numBeats;
    rotation = 0;
    beats = new ArrayList<Beat>();
    defaultBeatDistribution(sound);
  }
  
  public Ring(float radius, int numBeats, float rotation){
    this.radius = radius;
    this.numBeats = numBeats;
    this.rotation = rotation;
    beats = new ArrayList<Beat>();
    defaultBeatDistribution("");
  }
  public Ring(float radius, int numBeats, float rotation, String sound){
    this.radius = radius;
    this.numBeats = numBeats;
    this.rotation = rotation;
    beats = new ArrayList<Beat>();
    defaultBeatDistribution(sound);
    
  }
  
  public void defaultBeatDistribution(String sound){
    for(int ii=0;ii<numBeats;ii++){
      float rad = TWO_PI /numBeats * ii + rotation;
      beats.add(new Beat(radius * cos(rad) + width/2, //x
                         radius * sin(rad) + height/2, //x
                         roundRadian(rad),//radian rounded to 10
                         defaultBeatSize,//radius
                         sound)//sound
                         );
     
      beats.get(ii).setColor(color(255,255,255));                         
                         
    }//eo for
  }//eo defaultBeatDistribution
  
  
  public ArrayList<Beat> getBeats(){
    return beats;
  }
  
  public void toggleActive(int ... indices){
    for(int i : indices){
      beats.get(i).toggleActive();
    }
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