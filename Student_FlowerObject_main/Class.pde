class Object {

  // Variables
  float xSpeed; // Speed along the x axis
  float ySpeed; // Speed along the y axis

  float objectSize;     // radius of the flower petal
  float objectX_Pos;    // x-position of the center of the flower
  float objectY_Pos;    // y-position of the center of the flower

  boolean mouseControlled;

  boolean collision;

  Object(float temp_x, float temp_y, float temp_r, float temp_speed) {
    objectSize = temp_r;
    objectX_Pos = temp_x;
    objectY_Pos = temp_y;
    xSpeed = temp_speed;
    ySpeed = temp_speed/1.5;
  }

  // Constructor 2 that takes in an extra 
  Object(float temp_x, float temp_y, float temp_size, float temp_speed, boolean temp_mouseControlled) {
    objectSize = temp_size;
    objectX_Pos = temp_x;
    objectY_Pos = temp_y;
    mouseControlled = temp_mouseControlled;
    xSpeed = temp_speed;
    ySpeed = temp_speed*1.5;
  }

  void display () {
    if (!mouseControlled) {
      fill(200, 0, 0);
      ellipse(objectX_Pos, objectY_Pos, objectSize, objectSize);
    } else {
      fill(0, 200, 100);

      if (mouseX >= 0+objectSize/2 && mouseY >= 0+objectSize/2 && mouseX <= width-objectSize/2 && mouseY <= height-objectSize/2){
        objectX_Pos = mouseX;
        objectY_Pos = mouseY;
      }
      ellipse(objectX_Pos, objectY_Pos, objectSize, objectSize);
    }
  }

  // Move function that moves the object
  void move() {
    // X speed
    objectX_Pos = objectX_Pos + xSpeed;
    // Checks if it hits the upper and lower barriers
    if (objectX_Pos >= width-objectSize/2 || objectX_Pos <= 0+objectSize/2) {
      xSpeed = xSpeed *= -1;
    }

    // Y speed
    objectY_Pos = objectY_Pos + ySpeed;
    // Checks if it hits the upper and lower barriers
    if (objectY_Pos >= width-objectSize/2 || objectY_Pos <= 0+objectSize/2) {
      ySpeed = ySpeed *= -1;
    }
  }

  // Bounce function that takes in a variable of this class, that is the other object
  void bounce(Object other) {
    // Float that checks the distance between this and the other object
    float d = dist(objectX_Pos, objectY_Pos, other.objectX_Pos, other.objectY_Pos);
    // If the distance between them is smaller than the objects size AND the collision boolean is false:
    if (d < objectSize/2 + other.objectSize/2 && collision == false) { // collision boolean is just to prevent it getting stuck and bouncing back and forth
      // It will reverse the speed of the object
      xSpeed = xSpeed *= -1;
      ySpeed = ySpeed *= -1;
      // set the collision to true, to try and avoid the object getting stuck
      collision = true;
    } else {
      //Sets the collision to false when they are not touching
      collision = false;
    }
  }
}
