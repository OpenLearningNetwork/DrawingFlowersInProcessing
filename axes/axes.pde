void setup(){
  size(300,300);
}

void draw(){
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(60));
  drawAxes();
  popMatrix();
}

// Functions used:
// ellipse(x,y, width,height);
// line(x1,y1, x2, y2);
void drawAxes(){
  // Some styling
   background(255);
   strokeWeight(2);
   background(255);
   
   // Styling of the Y-axes
   stroke(255,0,0);
   line(0,0,0, 100); // Y-axes
   // Styling of the X-axes
   stroke(0,255,0);
   line(0,0,100,0); // X-axes
   
   // Styling of the circle
   stroke(0);
   // An ellipse with the same width and height is a circle
   ellipse(50,50, 30,30);
}