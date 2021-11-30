r = 0
theta = 0
radius = 0
init_pos = 0

def setup():
    global radius, displayWidth, displayHeight, init_pos
    size(displayWidth, displayHeight)
    background(0)
    noFill()
    strokeWeight(3)
    radius = width/16
    init_pos = radius
    
def draw():
    global r, theta, radius, init_pos
    # purple
    x_a = r*cos(theta - PI/2.) + width/2
    y_a = r*sin(theta - PI/2.) + height/2 - init_pos/3
    stroke(216, 9, 126, 25)
    beginShape()
    for i in range(360):
        noiseFactor = noise(i * 0.02, float(frameCount) / 150)
        shape_x = x_a + radius * cos(radians(i)) * noiseFactor
        shape_y = y_a + radius * sin(radians(i)) * noiseFactor
        curveVertex(shape_x, shape_y)
    endShape(CLOSE)
    # ellipse(x_a, y_a, 10, 10)
    
    # pink
    x_b = r*cos(theta + PI/10.) + width/2 + sqrt(3)/2*init_pos
    y_b = r*sin(theta + PI/10.) + height/2 + init_pos/2
    stroke(140, 87, 156, 25)
    beginShape()
    for i in range(360):
        noiseFactor = noise(i * 0.02+12, float(frameCount) / 150)
        shape_x = x_b + radius * cos(radians(i)) * noiseFactor
        shape_y = y_b + radius * sin(radians(i)) * noiseFactor
        curveVertex(shape_x, shape_y)
    endShape(CLOSE)
    # ellipse(x_b, y_b, 10, 10)
    
    # blue
    x_c = r*cos(theta - 1.2*PI) + width/2 - sqrt(3)/2*init_pos
    y_c = r*sin(theta - 1.2*PI) + height/2 + init_pos/2
    stroke(36, 70, 142, 25)
    beginShape()
    for i in range(360):
        noiseFactor = noise(i * 0.02+23, float(frameCount) / 150)
        shape_x = x_c + radius * cos(radians(i)) * noiseFactor
        shape_y = y_c + radius * sin(radians(i)) * noiseFactor
        curveVertex(shape_x, shape_y)
    endShape(CLOSE)
    # ellipse(x_c, y_c, 10, 10)
    
    theta += 2/360.
    r += 1.5
    
    radius += 0.5
    
    if frameCount == 1000:
        noLoop()
        save("spiral.jpeg")
