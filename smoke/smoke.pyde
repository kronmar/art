TOTAL_DEGREES = 360
radius = 0
r = random(255)
g = random(255)
b = random(255)

def setup():
    global displayWidth, displayHeight, radius
    size(displayWidth/2, displayHeight)
    background(0)
    noFill()
    strokeWeight(3)
    radius = displayHeight
    
def draw():
    global TOTAL_DEGREES, radius, r, g, b
    # first frame, setup color
    if frameCount%50 == 0:
        r = random(255)
        g = random(255)
        b = random(255)
        stroke(r, g, b, 10)
    translate(frameCount, frameCount)
    center_x = 0
    center_y = 0
    
    beginShape()
    for i in range(TOTAL_DEGREES):
        noiseFactor = noise(i * 0.02, float(frameCount) / 150)
        x = center_x + radius * cos(radians(i)) * noiseFactor
        y = center_y + radius * sin(radians(i)) * noiseFactor
        curveVertex(x, y)
    endShape(CLOSE)
    
    radius -= 1
    
    if radius == 0:
        noLoop()
        save("color_smoke.png")
    
