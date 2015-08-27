void setup(){
  size(200,200); 
}

void draw(){
 noStroke();
 pushMatrix();

 translate(width/2,height/2);
 // Because we are so lazy we will use a for loop
 for(int i = 0; i < 6; i++){
  // Let's create another coordinates system inside the coordinates system we created earlier with pushMatrix();
  pushMatrix();
  // Make the fill color green
  fill(0,255,0);
  
  // Rotate the coordinates system
  rotate(radians(i*60)); // when i = 0; rotate by 0 degrees, when i = 1 rotate by 60 degrees, etc...
  
  // Move the leaf a bit from the center
  translate(10,0);
  // Draw the leave
  ellipse(0,0, 90,40);
  popMatrix();
 }
 
 // Center of the flower
 
 // Make the fill color yellowish
 fill(#F9FA17);

 // Draw the center
 ellipse(0,0, 50,50);
 popMatrix();
}