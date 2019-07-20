class Edge {

  PVectorPlus a;
  PVectorPlus b;
  float dist;

  Edge(PVectorPlus a, PVectorPlus b) {
    this.a = a;
    this.b = b;
    this.dist = dist(a.loc.x, a.loc.y, b.loc.x, b.loc.y);
  }

  boolean equals(Edge other) {
    return (this.a == other.a) && (this.b == other.b) || (this.a == other.b) && (this.b == other.a);
  }

  int hashCode() {
    return this.a.hashCode() + this.b.hashCode();
  }

  void drawEdge() {
    if (dist <= maxDistanceForEdge) {
      strokeWeight(map(dist, 0, maxDistanceForEdge, 6, 0.03));
      stroke(255, map(dist, 0, maxDistanceForEdge, 250, 20));
      line(a.loc.x, a.loc.y, b.loc.x, b.loc.y);
    }
  }
}