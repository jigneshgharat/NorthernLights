// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(float x, float y) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = new PVector(x, y);
    lifespan = 180.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display()
  {
    if (lifespan > 170){
      stroke(#3399ff, lifespan/2);   //#3399ff
      strokeWeight( lifespan/35);
    fill(#3399ff, lifespan);
    ellipse(location.x, location.y, 0.05, 0.05); //4, 6
    
        } else if (lifespan > 140) {
    stroke(#2c50d5, lifespan);
   strokeWeight( lifespan/25);
    fill(#2c50d5, lifespan);
    ellipse(location.x, location.y, 0.1, 0.1);  //6, 10
    
    
    } else if (lifespan > 90) {
    stroke(#ff66ff, lifespan/2); 
    strokeWeight( lifespan/16);
    fill(#ff66ff, lifespan);
    ellipse(location.x, location.y, 0.5, 0.5);  //6, 10
    
  } else {stroke(#99ff99, lifespan);
    strokeWeight( lifespan/9);
    fill(#99ff99, lifespan);
    ellipse(location.x, location.y, 2, 2 );} //10, 10

  }


  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
