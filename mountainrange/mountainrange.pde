int[] R = {2, 13, 24, 35, 46, 57, 68, 79, 155};
int[] G = {16, 27, 38, 48, 59, 70, 81, 92, 167};
int[] B = {7, 19, 30, 42, 54, 65, 77, 89, 170};

void setup()
{
  size(960, 540);
  background(R[8], G[8], B[8]);
  stroke(255, 0, 0, 0);
  strokeWeight(2);
}

void draw()
{
  // randomSeed
  randomSeed(70);
  noiseSeed(12);
  noLoop();
  
  // Mountains
  for(int j = 7; j>-1; j--){
    // define base height
    int y = int(height*pow(0.7, j));
    
    // Mountainrange is overlay of two sin functions plus noise
    float a = random(-width/2., width/2.);
    float b = random(-width/2., width/2.);
    float c = random(1, 2);
    float d = random(40, 50);
    float e = random(-width/2., width/2.);
    
    float dx = 0;
    beginShape();
    fill(R[j], G[j], B[j]);
    // set first vertex, to color the area
    vertex(0, height);
    for(int x = 0; x < width; x ++){
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
    vertex(width, height);
    endShape();
  }
  // Clouds: overlay of many small circles with radius of 2 pixels
  float begin = random(50);
  
  float i = 0; 
  
  for(int x = 0; x < width; x += 2)
  {    
    float j = 0; 
    
    for(int y = 0; y < 2*height/3; y += 2)
    {     
      float alfaMax = map(y, 0, height/4, 520, 0);    
      float alfa = noise(begin + i, begin + j);
      alfa = map(alfa, 0.4, 1, 0, alfaMax);
      
      noStroke();    
      fill(color(255, 255, 255), alfa);
      ellipse(x, y, 2, 2);
      
      j += 0.05; //increase j faster than i so the clouds look horizontal
    }
    
    i += 0.01;
  }
  save("mountain.png");
}
