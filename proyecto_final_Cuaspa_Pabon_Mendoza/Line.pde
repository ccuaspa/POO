class Line extends Shape {
  float edge;
  
  Line(float taml) {
    setEdge(taml);
  }

  @Override
  void drawShape() {
    rect(0, 0, edge(), 0);
  }
  
  public float edge() {
    return edge;
  }

  public void setEdge(float e) {
    edge = e;
  }
}
