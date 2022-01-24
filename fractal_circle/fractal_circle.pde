void setup() {
  background(0);
  size(640, 360);
}

void draw() {
  drawCircle(width/2, height/2, 360);
}

void drawCircle(float x, float y, float radius) {
  stroke(255);
  noFill();
  ellipse(x, y, radius, radius);
  if(radius > 20) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
    drawCircle(x, y + radius/2, radius/2);
    drawCircle(x, y - radius/2, radius/2);
  }
}
