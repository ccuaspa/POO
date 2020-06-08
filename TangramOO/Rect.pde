class Rect extends Shape {
  float edge;
  
  /*public boolean grabsInput(float x, float y){
    if (key=="1"){
      return true;
    }
  }*/
  Rect() {
    setEdge(72);
  }

  @Override
  void drawShape() {
    rectMode(CENTER);
    rect(0, 0, edge(), edge());
  }
  
  public float edge() {
    return edge;
  }

  public void setEdge(float e) {
    edge = e;
  }
}
