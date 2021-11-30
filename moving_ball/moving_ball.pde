PVector location;
PVector velocity;
float rotx = 0; float roty = 0; float rotz = 0;

class PVector{
  
  float x;
  float y;
  float z;
  
  PVector(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
  }
  
  void add(PVector v) {
    y = y + v.y;
    x = x + v.x;
    z = z + v.z;
  }
}

void setup() {
  size(800, 800, P3D);

  background(255);
  
  location = new PVector(0, 0, 0);
  velocity = new PVector(2.5, 5, 1.3);

  //rotateZ(PI/3);
  //rotateY(PI/3);
  //rotateX(PI/3);
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  
  pushMatrix();
  stroke(0);
  noFill();
  translate(0, 0, 0);
  box(300);
  popMatrix();
  
  pushMatrix();
  rotateX(-PI/8);
  translate(location.x, location.y, location.z);
  rectMode(CENTER);
  noStroke();
  fill(128);
  sphere(20);
  popMatrix();
  
  location.add(velocity);
  
  if(location.x>130 || location.x<-130) {
    velocity.x = velocity.x * -1;
  }
  if(location.y>130 || location.y<-130) {
    velocity.y = velocity.y * -1;
  }
  if(location.z>130 || location.z<-130) {
    velocity.z = velocity.z * -1;
  }
  
  rotx+=0.001;
  roty+=0.0009;
  rotz+=0.0011;
  //rotateX(PI/3);
  //rotateY(PI/3);
  //rotateZ(PI/3);
}
