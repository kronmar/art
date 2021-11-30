int rows; 
int cols;
int scl = 20;
int w = 1800;
int h = 1800;
float flying = 0;

float[][] terrain;

void setup() {
  background(0);
  size(600, 600, P3D);
  cols = w/scl;
  rows = h/scl;
  // terrain represents the height of each point
  terrain = new float[cols][rows];
}

void draw() {
  // movement
  flying -= 0.1;
  float ny = flying;
  for (int y = 0; y < rows; y++) {
    float nx = 0;
    for (int x = 0; x < cols; x++) {
      // terrain adjust, map to heights between -100 and 100
      terrain[x][y] = map(noise(nx, ny), 0, 1, -100, 100);
      nx += 0.2;
    }
    ny += 0.2;
  }
  
  background(0);
  stroke(255);
  fill(50);
  
  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  // iterate through x and y to build the terrain
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  
  // save each frame
  if(frameCount < 50) {
    save("frame" + str(frameCount) + ".png");
  } else {
    noLoop();
  }
}
