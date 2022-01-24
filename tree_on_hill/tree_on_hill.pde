float len=80;
float theta=PI/5;
float r;
//int[] R = {  6, 6, 0, 0, 2, 15};
//int[] G = { 24, 24, 25, 24, 22, 19};
//int[] B = {  2,  2, 18, 26, 30, 29};
//int[] A = {255, 255, 240, 230, 220, 200};
//int[] R = {  6, 6, 18, 0, 2, 15};
//int[] G = { 24, 24, 29, 24, 22, 19};
//int[] B = {  2,  2, 19, 26, 30, 29};
//int[] A = {255, 255, 240, 230, 220, 200};
int[] R = {  6, 6, 18, 0, 2, 15};
int[] G = { 24, 24, 29, 24, 22, 19};
int[] B = {  2,  2, 19, 26, 30, 29};
int[] A = {255, 255, 240, 230, 220, 200};
int[] rtop = {33, 11, 1, 31, 93};
int[] gtop = {23, 29, 22, 19, 39};
int[] btop = {34, 2, 10, 7, 4};
int[] rlow = {14, 21, 9, 14, 14};
int[] glow = {13, 22, 11, 13, 13};
int[] blow = {12, 20, 10, 12, 12};

color b1 = color(253, 111, 21);
//color b1 = color(255, 161,  102);
//color b2 = color(  2, 28, 85);
color b2 = color( 51, 186, 206);
//color trunkc = color(22, 13, 2);
color trunkLight = color(83, 42, 3);
color trunkDark = color(31, 16, 2);
color leafLight = color(10, 68, 5);
color leafDark = color(1, 10, 4);

void setup()
{
  size(900, 600);
  background(255);
  for (int i = 0; i<=height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(b2, b1, inter);
    stroke(c, 200);
    line(0, i, width, i);
  }
  strokeWeight(2);
}

void draw() {
  for(int i = 14; i<15; i++){
    setup();
    //randomSeed(1);
    cloud();
    mountains2(i*69);
    randomSeed(97);
    tree(width/2, height, 0, 100, 1);
    noLoop();
    save("tree_on_hill_" + str(i) + ".png");
  }
    
}

void tree(float x, float y, float angle, float len, int gen) {
  
  strokeWeight(50*pow(0.6,gen)+1);
  float x2 = x - len * sin(angle);
  float y2 = y - len * cos(angle);
  if(gen < 10) {
    float interp = map(gen, 1, 10, 0, 1);
    color trunkc = lerpColor(trunkDark, trunkLight, interp);
    stroke(trunkc);
    line(x, y, x2, y2);
    tree(x2, y2, angle + random(0, 2*PI/9), len*0.8, gen+1);
    tree(x2, y2, angle - random(0, 2*PI/9), len*0.8, gen+1);
    float thining = random(0,1);
    if (thining > 0.6){
      tree((x+x2)/2, (y+y2)/2, angle - random(PI/10, 2*PI/40), len*0.8, gen+1);
    }
  }else if (gen<12){
    //line(x, y, x2, y2);
    pushMatrix();
    translate((x+x2)/2, (y+y2)/2);
    rotate(angle);
    noStroke();
    float tmp = random(0,1);
    color leafc = lerpColor(leafDark, leafLight, tmp);
    fill(leafc);
    ellipse(0, 0, len, len/2);
    popMatrix();
    float thining = random(0,1);
    tree(x2, y2, angle + random(0, 2*PI/9), len*0.8, gen+1);
    tree(x2, y2, angle - random(0, 2*PI/9), len*0.8, gen+1);
    if (thining > 0.5){
      tree((x+x2)/2, (y+y2)/2, angle - random(PI/10, 2*PI/40), len*0.8, gen+1);
    }
  }
  
  if (gen<12) {
    

  }
}
void cloud() {
  float begin = random(50);

  float i = 0; 

  for (int x = 0; x < width; x += 2)
  {    
    float j = 0; 

    for (int y = 0; y < height; y += 2)
    {     
      float alfaMax = map(y, 0, height/4, 520, 0);    
      float alfa = noise(begin + i, begin + j);
      alfa = map(alfa, 0.4, 1, 0, alfaMax);

      noStroke();    
      fill(color(255, 153, 55), alfa);
      ellipse(x, y, 2, 2);

      j += 0.05; //increase j faster than i so the clouds look horizontal
    }

    i += 0.01;
  }
}

void mountains(int seed) {
  // randomSeed
  randomSeed(seed);
  noiseSeed(12);
  noLoop();
  noStroke();

  // Mountains: those far behind
  for (int j = 4; j>-1; j--) {
    // define base height
    int y = int(height*pow(0.9, j));

    // Mountainrange is overlay of two sin functions plus noise
    float a = random(-width/2., width/2.);
    float b = random(-width/2., width/2.);
    float c = random(1, 2);
    float d = random(30, 50);
    float e = random(-width/2., width/2.);

    float dx = 0;
    beginShape();
    fill(R[j], G[j], B[j], A[j]);
    // set first vertex, to color the area
    vertex(-100, height);
    for (int x = 0; x < width; x ++) {
      float tmp_y = y;
      tmp_y += 10*j*sin(2*dx/j + a);
      tmp_y += c*j*sin(5*dx/j + b);
      // Noise grows towards front (high y values => less disturbed)
      tmp_y += d*j*noise(1.2*dx/j +e);
      tmp_y += 1.7*j*noise(10*dx);
      curveVertex(x, tmp_y);

      dx += 0.02;
    }
    // close loop and shape
    vertex(width+100, height);
    endShape();
    }
  //save("mountain.png");
}

void mountains2(int seed) {
  // randomSeed
  randomSeed(seed);
  noiseSeed(12);
  noLoop();
  noStroke();

  // Mountains: those far behind
  for (int j = 4; j>-1; j--) {
    // define base height
    int y = int(height*pow(0.9, j));

    // Mountainrange is overlay of two sin functions plus noise
    float a = random(-width/2., width/2.);
    float b = random(-width/2., width/2.);
    float c = random(1, 2);
    float d = random(30, 50);
    float e = random(-width/2., width/2.);
    color c1 = color(rtop[j], gtop[j], btop[j]);
    color c2 = color(rlow[j], glow[j], blow[j]);
    for(int y2 = 0; y2<200; y2++){
      float dx = 0;
      noFill();
      beginShape();
      strokeWeight(5);
      float interp = map(y2, 0, 200, 0, 1);
      color strokeC = lerpColor(c1, c2, interp);
      stroke(strokeC);
      // set first vertex, to color the area
      for (int x = 0; x < width; x = x+1) {
        float tmp_y = y + y2;
        tmp_y += 10*j*sin(2*dx/j + a);
        tmp_y += c*j*sin(5*dx/j + b);
        // Noise grows towards front (high y values => less disturbed)
        tmp_y += d*j*noise(1.2*dx/j +e);
        tmp_y += 1.7*j*noise(10*dx);
        curveVertex(x, tmp_y);
  
        dx += 0.02;
      }
      // close loop and shape
      //vertex(width+100, height);
      endShape();
    }
  }
  //save("mountain.png");
}
