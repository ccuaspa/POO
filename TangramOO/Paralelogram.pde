class Paralelogram extends Shape {
  float edge;
  /*
  public boolean grabsInput(float x, float y){
    return true;
  }
  */
  Paralelogram() {
    setEdge(102);
  }

  @Override
  void drawShape() {
    rectMode(CENTER);
    quad(0, 0, edge(),0,edge()+edge()/2,-edge()/2, edge()/2,-edge()/2 );
  }

  public float edge() {
    return edge;
  }

  public void setEdge(float e) {
    edge = e;
  }
}
