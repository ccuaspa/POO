package poo4;

import processing.core.PApplet;

class SParaGramo extends ShadowShape{
    protected float _edge;

  public SParaGramo(PApplet parent, float x, float y, float r, float sx, float sy) {
    super(parent,x,y,r,sx,sy);
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