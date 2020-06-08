package poo4;

import processing.core.PApplet;
import processing.core.PVector;

abstract class Shape {
  public float _rot;
  public PVector _scl;
  public float _col;
  public PApplet _parent;
  public PVector _trans;

  // TODO: estilo
  // implemente el estilo del shape (i.e., stroke weight, color, etc)
  // como se hace con los demás atributos de la clase

  // TODO: modifique o defina los constructores que necesite

  public Shape(PApplet parent) {
    this(parent, parent.random(100, parent.width-100), parent.random(100, parent.height-100), 0, 1, 1);
  }

  public Shape(PApplet parent, float x, float y, float r, float sx, float sy) {
    _parent = parent;
    _trans = new PVector(x, y);
    _rot = r;
    _scl = new PVector(sx, sy);
  }

  public void draw() {
    _parent.push();
    _parent.translate(translation().x, translation().y);
    _parent.rotate(rotation());
    _parent.scale(scaling().x, scaling().y);
    // TODO aplique el estilo aca
    //System.out.println("aqui sale el color" + "-" + color());
    _parent.fill(_col);
    drawShape();
    _parent.pop();
  }

  // TODO: para la seleccion de la pieza escoja uno de los siguientes prototipos
  // public abstract boolean grabsInput(float x, float y);
  // public boolean grabsInput(float x, float y) {}

  protected abstract void drawShape();

  public PVector scaling() {
    return _scl;
  }

  public void setScaling(float sx, float sy) {
    _scl.x = sx;
    _scl.y = sy;
  }

  public float rotation() {
    return _rot;
  }

  public void setRotation(float r) {
    _rot = r;
  }

  public PVector translation() {
    return _trans;
  }

  public void setTranslation(float x, float y) {
    _trans.x = x;
    _trans.y = y;
  }

  public float color() {
    return _col;
  }

  public void setColor(float c) {
    _col = c;
  }
}