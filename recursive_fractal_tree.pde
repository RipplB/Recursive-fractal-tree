import g4p_controls.*;

public float ANGLE = PI/3; //angle of branches
public float BRANCHLENGTH = 300; // init length of branches
public float RO = 0.6; // decreasement of branchlength, don't go above 0.8 on regular pc, and never ever go above 0.99
public short MINDRAW = 20; // minimum length of new branches
public short THICKNESS = 10; // length divided by this gives thicknees
public short bgR = 80,bgG = 80,bgB = 80; // background color
public short brR = 255,brG = 255,brB = 255; // branch color


void setup(){
  fullScreen(JAVA2D);
  frameRate(60);
  stroke(255);
  createGUI();
}

void draw(){
  translate(width/2,height);
  background(color(bgR,bgG,bgB));
  stroke(color(brR,brG,brB));
  branch(BRANCHLENGTH);
}

void branch(float len){
  strokeWeight(len/THICKNESS);
  line(0,0,0,-len);
  if(len>MINDRAW){
    translate(0,-len);
    pushMatrix();
    rotate(ANGLE);
    branch(len*RO);
    popMatrix();
    pushMatrix();
    rotate(-ANGLE);
    branch(len*RO);
    popMatrix();
  }
}

public void setAngle(float an){
  ANGLE = PI*an; 
}

public void setLength(float len){
  BRANCHLENGTH = len;
}

public void setRo(float ro){
  if(ro <= 0.8){
    RO = ro;
  }
}

public void setMinimum(short min){
  if(min > 0){  
    MINDRAW = min;
  }
}

public void setThickness(short t){
  if(t > 1){
    THICKNESS = t;
  }
}
