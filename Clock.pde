public class Clock{
  float x;
  float y;
  float radius;
  
  float needle;
  ArrayList<Ring> rings;
  
  int timeSignature;
  //two rings below 40 for perc/beat 
  
  public Clock(){
    rings = new ArrayList<Ring>();
    x = width/2;
    y = height/2;
    radius = width/2 - defaultBeatSize; //visual buffer
    addRing(new Ring(radius,0,0)); // outline
    needle = 0;
  }
  public Clock(int timeSignature1, int timeSignature2){
    rings = new ArrayList<Ring>();
    x = width/2;
    y = height/2;
    radius = width/2 - defaultBeatSize; //visual buffer
    addRing(new Ring(radius,0,0)); // outline
    needle = 0;
    this.timeSignature = timeSignature1 + timeSignature2;
    addRing(new Ring(20,timeSignature1,"sounds/drums/kicks/808bd.aif"));
    addRing(new Ring(30,timeSignature2,TWO_PI/4,"sounds/drums/snares/909sd.aif"));
  }

  public void addRing(Ring r){
    rings.add(r);
  }
  
  public ArrayList<Ring> getRings(){
    return rings;
  }
  public void setNeedle(float needle){
    this.needle = needle;
  }
  public void setNeedle(float x, float y){
    //needle.set(x,y);
  }
  public void incNeedle(float amount){
    needle += amount;
    needle = needle % TWO_PI;
  }
  
  public void toggleActive(int ring, int ... beats){
    rings.get(ring).toggleActive(beats);
  }
  public void check(){
    for(Ring r : rings){
      r.check(roundRadian(needle));
    }
  }
  public void draw(){
    for(Ring r : rings){
      noFill();
      r.draw();
    }
    line(x,y,x + radius * cos(needle),y + radius*sin(needle));
  }
  
}