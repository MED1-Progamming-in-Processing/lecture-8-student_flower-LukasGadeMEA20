class Object {

  // Variables
  float xSpeed; // Speed along the x axis
  float ySpeed; // Speed along the y axis

  float objectSize;     // radius of the flower petal

  int num = 40;

  float[] objectX_Pos = new float[num];    // x-position of the center of the flower
  float[] objectY_Pos = new float[num];    // y-position of the center of the flower

  int indexPosition = 0;

  boolean transTailed;

  boolean collision;

  Object(float _x, float _y, float _r, float _speed) {
    objectSize = _r;
    objectX_Pos[0] = _x;
    objectY_Pos[0] = _y;
    xSpeed = _speed;
    ySpeed = _speed/1.5;
  }

  // Constructor 2 that takes in an extra 
  Object(float _x, float _y, float _size, float _speed, boolean _transTailed) {
    objectSize = _size;
    objectX_Pos[0] = _x;
    objectY_Pos[0] = _y;
    transTailed = _transTailed;
    xSpeed = _speed;
    ySpeed = _speed*1.5;
  }

  void display () {
    if (!transTailed) {
      fill(200, 0, 0);
      // Draw the circles
      for (int i = num-1; i > 0; i--) {
        ellipse(objectX_Pos[i], objectY_Pos[i], objectSize-i, objectSize-i);
      }
    } else {
      fill(0, 200, 100);
      indexPosition = (indexPosition + 1) % num;
      objectX_Pos[indexPosition] = mouseX;
      objectY_Pos[indexPosition] = mouseY;
      for (int i = 0; i < num; i++) {
        // Set the array position to read
        int pos = (indexPosition + i) % num;
        float radius = objectSize+i-num;
        ellipse(objectX_Pos[pos], objectY_Pos[pos], radius, radius);
      }
    }
  }

  // Move function that moves the object
  void move() {

    for (int i = num-1; i > 0; i--) {
      objectX_Pos[i] = objectX_Pos[i-1];
      objectY_Pos[i] = objectY_Pos[i-1];
    }

    // X speed
    // Moves the first position of the X array according to the speed
    objectX_Pos[0] = objectX_Pos[0] + xSpeed;

    // Checks if it hits the right and left barriers, reversing the speed if it does.
    if (objectX_Pos[0] >= width-objectSize/2 || objectX_Pos[0] <= 0+objectSize/2) {
      xSpeed = xSpeed *= -1;
    }

    // Y speed
    // Moves the first position of the Y array according to the speed
    objectY_Pos[0] = objectY_Pos[0] + ySpeed;
    // Checks if it hits the upper and lower barriers, reversing the speed if it does.
    if (objectY_Pos[0] >= width-objectSize/2 || objectY_Pos[0] <= 0+objectSize/2) {
      ySpeed = ySpeed *= -1;
    }
  }

  // Bounce function that takes in a variable of this class, that is the other object
  void bounce(Object other) {
    // Float that checks the distance between this and the other object
    float d = dist(objectX_Pos[indexPosition], objectY_Pos[indexPosition], other.objectX_Pos[indexPosition], other.objectY_Pos[indexPosition]);
    // If the distance between them is smaller than the objects size AND the collision boolean is false:
    if (d < objectSize/2 + other.objectSize/2 && collision == false) { // collision boolean is just to prevent it getting stuck and bouncing back and forth
      // It will reverse the speed of the object
      println(d);
      xSpeed *= -1;
      ySpeed *= -1;
      // set the collision to true, to try and avoid the object getting stuck
      collision = true;
    } else {
      //Sets the collision to false when they are not touching
      collision = false;
    }
  }
}
