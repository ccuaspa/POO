class Rect2 extends Shape {
  float edge;
  
  Rect2() {
    setEdge(210);
  }

  @Override
  void drawShape() {
    rectMode(CENTER);
    rect(0, 0, edge()+390, edge());
  }
  
  public float edge() {
    return edge;
  }

  public void setEdge(float e) {
    edge = e;
  }
}
