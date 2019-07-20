class PVectorPlus {

  PVector loc;
  PVector vel;
  int age;

  PVectorPlus(long locX, long locY, long velX, long velY) {
    loc = new PVector(locX, locY);
    vel = new PVector(velX, velY);
    age = 0;
  }

  void move() {
    vel.limit(maxVel);
    loc.add(vel);
    vel.mult(random(0.999, 1.001));
    if (vel.mag() < minVel) {
      vel.mult(1.001);
    }
    //wrapScreenEdges();
    bounceScreenEdges();
  }

  void wrapScreenEdges() {
    if (loc.y > height) {
      loc.y = 0;
    }
    if (loc.y < 0) {
      loc.y = height;
    }
    if (loc.x > width) {
      loc.x = 0;
    }
    if (loc.x < 0) {
      loc.x = width;
    }
  }

  void bounceScreenEdges() {
    if (loc.y > height || loc.y < 0) {
      vel.y = -vel.y;
    }
    if (loc.x > width || loc.x < 0) {
      vel.x = -vel.x;
    }
  }

  void drawPoint() {
    noStroke();
    fill(100, 0, map(age, 0, maxAge, 200, 0), map(age, 0, maxAge, 255, 100));
    ellipse(loc.x, loc.y, 12, 12);
  }
}