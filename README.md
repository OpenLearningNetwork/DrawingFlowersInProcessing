Drawing flowers in Processing (with matrix transformations)
========================


Ever wanted to draw a flower in Processing? You might think that a simple thing such as a flower must be very easy to draw in Processing? Well it actually is very easy, but not for everyone. In this tutorial you will learn how to draw a beautiful little flower in Processing by using matrix transformations.

(Full code of __all__ the examples is on __Github__)

## What we want
![Flower](http://i.imgur.com/yj4VpW3.png)

We would like to have something like the image above. The colors may be badly chosen, but hey, I'm not an artist. 

## Prerequirements

* Some Processing and Java knowledge
* Some math knowledge 
* Processing IDE installed on your computing device

## Let's get started

Before we are going to draw our flower, we must understand what matrix transformations are and how they work.

Let's say we draw x and y-axes and in the middle a circle, we would do this at coordinates (X,Y) = (0,0);

Our code would look like this:
````
void setup(){
	size(600,600);
}

void draw(){
	drawAxes();
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
   line(0,0,0, 100); // Y-axes (red)
   // Styling of the X-axes
   stroke(0,255,0);
   line(0,0,100,0); // X-axes (green)
   
   // Styling of the circle
   stroke(0);
   // An ellipse with the same width and height is a circle
   ellipse(50,50, 30,30);
}
````

When we run this, it looks like this:
![First example](http://i.imgur.com/AxbASxE.png)

We would like to move this whole construction to the center, but we don't want to change all the coordinates. For this we can use __matrix transformations__.

We start with creating a new coordinates subsystem by using _pushMatrix()_.
Now we can move this new coordinates system anywhere we would like, we want for example to move the origin of the coordinates system (0,0) to the center of our page.

```
// ...

void draw(){
	pushMatrix();
    translate(width/2, height/2); // Move the coordinates system to the center of the page
    // When we are done with our transformations we need to pop the matrix
    popMatrix();
}

// ...
```

We now get this:

![Example two](http://i.imgur.com/Y6j0UeN.png)

The nice thing about this approach is that we didn't need to modify any of the code in _drawAxes()_ everything stayed exactly the same. This is because we moved the origin of the coordinates system to another point.

Another nice function is _rotate()_, it is used to rotate the coordinates system. This is useful for drawing the leaves of our flower.

The rotate function only accepts radians but if you don't like them just convert your degrees to radians with _radians(int degrees)_.

An example:
`````
void draw(){
	pushMatrix();
    translate(width/2, height/2) // Let's move our origin again
    rotate(radians(60)) // rotate the coordinates system by 60 degrees
    drawAxes();
    popMatrix(); // Always use popMatrix() when you're done!
}
`````

This results into this:
![Example three](http://i.imgur.com/ZaAwqVz.png)

Again, we didn't change anything in _drawAxes()_.

## Now, back to the flower

Knowing how matrix transformations work, we can finally draw our flower:

`````

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
`````

A new thing is the nested matrix transformation, it works the same way as before the only difference is that is uses the origin and rotation set by the parent matrix transformation.

Now we have our beautiful flower:
![flower](http://i.imgur.com/yj4VpW3.png)

There is probably alot more math involved with this, but I didn't want to make this too difficult to understand.

_All the source code of this tutorial is available on [this](https://github.com/OpenLearningNetwork/DrawingFlowersInProcessing) Github repository.
If you have any questions or if something wasn't clear or even worse, if I made a mistake, please leave it below in the comments section._
