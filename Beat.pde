public class Beat{ 
  float x;
  float y;
  float radius;
  color c;
  
  int timer; //animation purposes
  int pulseLength = 20; //length of pulse
  boolean animating;
  
  float radian; //for checking collide
  boolean active; //place on ring or not
  
  String name;
  AudioSample sound;

  
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
    name = sound;
    try{
      this.sound = minim.loadSample(sound);
    }catch(Exception e){
      println("Could not find file");
    }
    active = true;
    timer = 0;
  }
  
  public void setPosition(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public void toggleActive(){
    this.active = !active;
  }
  
  public void setSound(AudioSample sound){
    this.sound = sound;
  }
  
  public void setSound(String sound){
    this.sound = minim.loadSample(sound);
  }
  
  public void setColor(color c){
    this.c = c;
  }
  public void play(){
    if(debug){
      println("Playing : " + name);
    }
    c = color(255,0,0);
    animating = true;
    sound.trigger();
  }
  
  public void check(float radian){
    if(active && (this.radian == radian
        || this.radian == 0 && radian == 6.28
        || (this.radian > radian && this.radian < radian + needleInc))){ //for imperfect timing/spacing of beats
      play();
    }
  }
  
  
  public void draw(){
    if(active){
      if(animating){
        timer += 1;
        if(timer < pulseLength/2){
          c = color(red(c),green(c),blue(c),alpha(c)*.9);
        } else if(timer < pulseLength){
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
}