class Circle extends Shape {
  float edge;

  Circle(float tamc) {
    setEdge(tamc);
  }

  @Override
  void drawShape() {
    circle(0, 0, edge());
  }
  
  public float edge() {
    return edge;
  }

  public void setEdge(float e) {
    edge = e;
  }
}
