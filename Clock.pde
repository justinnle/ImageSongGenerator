public class Clock{
  float x;
  float y;
  float radius;
  
  PVector needle;
  ArrayList<Ring> rings;
  
  public Clock(){
    rings = new ArrayList<Ring>();
    x = width/2;
    y = height/2;
    radius = width/2 - defaultBeatSize; //visual buffer
    addRing(new Ring(radius,0));
    needle = new PVector(0,0);
  }

  public void addRing(Ring r){
    rings.add(r);
  }
  
  public ArrayList<Ring> getRings(){
    return rings;
  }
  public void setNeedle(PVector needle){
    this.needle = needle;
  }
  public void setNeedle(float x, float y){
    needle.set(x,y);
  }
  public void incNeedle(float amount){
    needle.x += amount;
    needle.y += amount;
  }
  public void draw(){
    for(Ring r : rings){
      r.draw();
    }
    line(x,y,x + radius * cos(needle.x),y + radius*sin(needle.y));
  }
  
}