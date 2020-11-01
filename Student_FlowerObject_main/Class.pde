class Object {

  // Variables
  float xSpeed; // Speed along the x axis
  float ySpeed; // Speed along the y axis

  float objectSize;     // radius of the flower petal

  int num = 10;

  float[] objectX_Pos = new float[num];    // x-position of the center of the flower
  float[] objectY_Pos = new float[num];    // y-position of the center of the flower

  int indexPosition;

  boolean transTailed;

  boolean collision;

  Object(float _x, float _y, float _r, float _speed) {
    objectSize = _r;
    objectX_Pos[indexPosition] = _x;
    objectY_Pos[indexPosition] = _y;
    xSpeed = _speed;
    ySpeed = _speed/1.5;
  }

  // Constructor 2 that takes in an extra 
  Object(float _x, float _y, float _size, float _speed, boolean _transTailed) {
    objectSize = _size;
    objectX_Pos[indexPosition] = _x;
    objectY_Pos[indexPosition] = _y;
    transTailed = _transTailed;
    xSpeed = _speed;
    ySpeed = _speed*1.5;
  }

  void display () {
    if (!transTailed) {
      fill(200, 0, 0);
      indexPosition = (indexPosition + 1) % num;
      objectX_Pos[indexPosition] = mouseX;
      objectY_Pos[indexPosition] = mouseY;
      for (int i = num-1; i > 0; i--) {
        // Set the array position to read
        int pos = (indexPosition + i) % num;
        float radius = (objectSize+i) / 2.0;
        ellipse(objectX_Pos[pos], objectY_Pos[pos], radius, radius);
      }
      //ellipse(objectX_Pos[indexPosition], objectY_Pos[indexPosition], objectSize, objectSize);
    } else {
      fill(0, 200, 100);

      /*if (mouseX >= 0+objectSize/2 && mouseY >= 0+objectSize/2 && mouseX <= width-objectSize/2 && mouseY <= height-objectSize/2){
       objectX_Pos = mouseX;
       objectY_Pos = mouseY;
       }*/
      objectX_Pos[indexPosition] = mouseX;
      objectY_Pos[indexPosition] = mouseY;
      ellipse(objectX_Pos[indexPosition], objectY_Pos[indexPosition], objectSize, objectSize);
    }
  }

  // Move function that moves the object
  void move() {
    // X speed
    //objectX_Pos[indexPosition] = objectX_Pos[indexPosition] + xSpeed;
    objectX_Pos[indexPosition] = mouseX;
    // Checks if it hits the right and left barriers
    if (objectX_Pos[indexPosition] >= width-objectSize/2 || objectX_Pos[indexPosition] <= 0+objectSize/2) {
      xSpeed = xSpeed *= -1;
    }

    // Y speed
    //objectY_Pos[indexPosition] = objectY_Pos[indexPosition] + ySpeed;
    objectY_Pos[indexPosition] = mouseY;
    // Checks if it hits the upper and lower barriers
    if (objectY_Pos[indexPosition] >= width-objectSize/2 || objectY_Pos[indexPosition] <= 0+objectSize/2) {
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
      xSpeed *= -1;
      ySpeed *= -1;
      other.xSpeed *= -1;
      other.ySpeed *= -1;
      // set the collision to true, to try and avoid the object getting stuck
      collision = true;
    } else {
      //Sets the collision to false when they are not touching
      collision = false;
    }
  }
}
