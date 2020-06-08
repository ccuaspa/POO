package poo4;

import processing.core.PApplet;

class Rect extends Shape {
  protected float _edge;

  public Rect(PApplet parent) {
    super(parent);
    setEdge(100);
  }

  @Override
  protected void drawShape() {
    _parent.rectMode(PApplet.CENTER);
    _parent.rect(0, 0, edge(), edge());
  }

  public float edge() {
    return _edge;
  }

  public void setEdge(float e) {
    _edge = e;
  }
}
