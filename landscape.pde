int r = 10;
int rows, cols ,mButton;
float zero=0,xoff, yoff, offset=0.05,depth=-600;
View v;

void setup() {
  size(800, 600, P3D);
  noiseDetail(3, 3.5);
  rows = int(height/r);
  cols = int(width/r);
  v = new View();
  frameRate(33);
}

void draw() {
  background(255);
  pointLight(255, 200, 0, width/2,height/2,-depth);
  translate(width/2, height*2/3, depth);
  v.rotate();
  zero += 0.02;
  landscape();
}

void landscape() {
  pushMatrix();
  translate(-width/2,0,depth/2);
  rotateX(PI/3);
  stroke(50);
  xoff = zero;
  for (int i=0;i<cols;i++) {
    xoff += offset;
    yoff = zero;
    for (int j=0;j<rows;j++) {
      yoff += offset;
      drawBlock(i, j);
    }
  }
  popMatrix();
}

void drawBlock(int x_, int y_) {
  float z0,z1=noise(xoff, yoff) ,
  z2=noise(xoff, yoff+offset) ,
  z3=noise(xoff+offset, yoff+offset) ,
  z4=noise(xoff+offset, yoff);
  fill(#66cc66);
  beginShape();
  vertex(r*x_, r*y_, r*z1);
  vertex(r*x_, r*(y_+1), r*z2);
  vertex(r*(x_+1), r*(y_+1), r*z3);
  vertex(r*(x_+1), r*y_, r*z4);
  endShape(CLOSE);
}

void mousePressed() {
  mButton = mouseButton;
}

void mouseDragged() {
  v.dragging();
}

