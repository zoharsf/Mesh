import java.util.*;

ArrayList<PVectorPlus> array;
HashSet<Edge> edges;
int noiseSeed = 0;
int maxDistanceForEdge = 170;
int startDotNum = 1;
int maxDotNum = 140;
float maxVel = 6;
float minVel = 0.5;
int maxAge = 170;
int stage = 0;
int frame = 0;
boolean saveImage = false;
float spawnChance = 0.9;

void setup() {
  size(800, 800);

  array = new ArrayList();
  edges = new HashSet();

  for (int i=0; i< startDotNum; i++) {
    generateDot((int)random(width), (int)random(height));
  }
}

void draw() {
  background(0);
  edges = new HashSet();
  println("number: " + array.size() + " frame: " + frame);

  move();
  populateEdges();
  drawEdges();
  killOldPoints();
  drawPoints();

  if (stage == 0) {
    spawn();
  } else {
    spawnChance = spawnChance-0.3;
  }
  if (array.size() >= maxDotNum) {
    stage = 1;
  }

  if (saveImage) {
    saveFrame();
  }
}

void move() {
  for (PVectorPlus v : array) {
    v.move();
  }
}

void drawPoints() {
  for (PVectorPlus v : array) {
    v.drawPoint();
  }
}

void spawn() {
  if (random(1) < spawnChance) {
    generateDot((int)random(width), (int)random(height));
  }
}

void saveFrame() {
  if (array.size() > 0) {
    saveFrame("output/"+nf(frame, 3)+".png");
    frame++;
  }
}

void killOldPoints() {
  ArrayList<PVectorPlus> newArray = new ArrayList();
  for (PVectorPlus v : array) {
    v.age++;
    if (v.age < maxAge) {
      newArray.add(v);
    }
  }
  array = newArray;
}

void populateEdges() {
  for (PVectorPlus v : array) {
    for (PVectorPlus other : array) {
      Edge e = new Edge(v, other);
      if (e.dist < maxDistanceForEdge) {
        edges.add(e);
      }
    }
  }
}

void drawEdges() {
  for (Edge e : edges) {
    e.drawEdge();
  }
}

void mousePressed() {
  generateDot(mouseX, mouseY);
}

void generateDot(int x, int y) {
  array.add(array.size(), new PVectorPlus(x, y, (long)random(-maxVel, maxVel), (long)random(-maxVel, maxVel)));
}