package poo4;

import processing.core.PApplet;

class TriAL extends Shape{
    protected float _edge;

  public TriAL(PApplet parent) {
    super(parent);
    setEdge(100);
  }

  @Override
  protected void drawShape() {
    //_parent.fill(Shape.color());
    _parent.triangle(0, 0, 2*edge(), 0, 0, -2*edge());
  }

  public float edge() {
    return _edge;
  }

  public void setEdge(float e) {
    _edge = e;
  }
}