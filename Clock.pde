public class Clock{
  float x;
  float y;
  float radius;
  
  float needle;
  ArrayList<Ring> rings;
  
  public Clock(){
    rings = new ArrayList<Ring>();
    x = width/2;
    y = height/2;
    radius = width/2 - defaultBeatSize; //visual buffer
    addRing(new Ring(radius,0));
    needle = 0;
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
  
  public void check(){
    for(Ring r : rings){
      r.check(round(needle,2));
    }
  }
  public void draw(){
    for(Ring r : rings){
      r.draw();
    }
    line(x,y,x + radius * cos(needle),y + radius*sin(needle));
  }
  
}