public class Beat{ 
  float x;
  float y;
  float radian; //for checking collide
  
  float radius;
  
  boolean active;
  AudioPlayer sound;

  
  public Beat(float x, float y, float radian, float radius){
    this.x = x;
    this.y = y;
    this.radian = radian;
    this.radius = radius;
    active = true;
  }

  public Beat(float x, float y, float radian, float radius, String sound){
    this.x = x;
    this.y = y;
    this.radian = radian;
    this.radius = radius;
    this.sound = minim.loadFile(sound);
    active = true;
  }
  
  public void setPosition(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public void setActive(boolean active){
    this.active = active;
  }
  
  public void setSound(AudioPlayer sound){
    this.sound = sound;
  }
  
  public void setSound(String sound){
    this.sound = minim.loadFile(sound);
  }
  
  public void draw(){
    ellipse(x,y,radius,radius);
  }
}