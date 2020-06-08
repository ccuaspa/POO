package poo4;

import processing.core.PApplet;

class ParaGramo extends Shape{
    protected float _edge;

  public ParaGramo(PApplet parent) {
    super(parent);
    setEdge(100);
  }

  @Override
  protected void drawShape() {
    _parent.quad(0, 0, edge(), 0, 0, -edge(), -edge(), -edge());
  }

  public float edge() {
    return _edge;
  }

  public void setEdge(float e) {
    _edge = e;
  }
}