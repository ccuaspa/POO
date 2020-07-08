abstract class Graph  {
  public PVector _pos;
  public float _mag;
  public float _ang;
  public color _col;
  //public PApplet _parent;
  
  public Graph(){
    this(0, 0, 0, 0, color(0,0,0));
  }
  
  public Graph(float x, float y, float m, float a, color c)  {
    _pos = new PVector(x,y);
    _mag = m;
    _ang = a;
    _col = c;
  }
  
  public void draw()  {
    push();
    translate(Pos().x,Pos().y);
    stroke(_col);
    strokeWeight(2);
    draWave();
    pop();
  }
  
  protected abstract void draWave();
  public abstract PVector getFCoord();
  
  
  public void setPos(float x, float y)  {
    _pos.x = x;
    _pos.y = y;
  }
  
  public void setMag(float m)  {
    _mag = m;
  }
  
  public void setAng(float a)  {
    _ang = a;
  }
  
  public void setCol(color c)  {
    _col = c;
  }
  
  public PVector Pos()  {
    return _pos;
  }
  
  public float Mag()  {
    return _mag;
  }
  
  public float Ang()  {
    return _ang;
  }
  
  public color Col()  {
    return _col;
  }
}
