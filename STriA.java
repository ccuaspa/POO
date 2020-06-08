package poo4;

import processing.core.PApplet;

class STriA extends ShadowShape{
    protected float _edge;

  public STriA(PApplet parent) {
    super(parent);
    setEdge(100);
  }

  @Override
  protected void drawShape() {
    //_parent.fill(Shape.color());
    _parent.triangle(0, 0, edge(), 0, 0, -edge());
  }

  public float edge() {
    return _edge;
  }

  public void setEdge(float e) {
    _edge = e;
  }
}