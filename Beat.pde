public class Beat{ 
  float x;
  float y;
  float radius;
  color c;
  
  int timer; //animation purposes
  boolean animating;
  
  float radian; //for checking collide
  boolean active; //place on ring or not
  
  AudioPlayer sound;

  
  public Beat(float x, float y, float radian, float radius){
    this.x = x;
    this.y = y;
    this.radian = radian;
    this.radius = radius;
    active = true;
    timer = 0;
  }

  public Beat(float x, float y, float radian, float radius, String sound){
    this.x = x;
    this.y = y;
    this.radian = radian;
    this.radius = radius;
    this.sound = minim.loadFile(sound);
    active = true;
    timer = 0;
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
  
  public void setColor(color c){
    this.c = c;
  }
  public void play(){
    c = color(255,0,0);
    animating = true;
  }
  
  public void check(float radian){
    if(this.radian == radian
        || this.radian == 0 && radian == 6.28
        || this.radian == radian + .01
        || this.radian == radian - .01){ //account for error
      play();
    }
  }
  
  
  public void draw(){
    if(animating){
      timer += 1;
      if(timer < 10){
        c = color(red(c),green(c),blue(c),alpha(c)*.9);
      } else if(timer < 20){
        c = color(red(c),green(c),blue(c),alpha(c)*1.1);
      } else{
        timer = 0;
        animating = false;
      }
    }
    fill(c);
    ellipse(x,y,radius,radius);
    fill(drawColor);
  }
}