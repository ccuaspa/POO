package poo4;

import processing.core.PApplet;

class STriA extends ShadowShape{
    protected float _edge;

  public STriA(PApplet parent, float x, float y, float r, float sx, float sy) {
    super(parent,x,y,r,sx,sy);
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