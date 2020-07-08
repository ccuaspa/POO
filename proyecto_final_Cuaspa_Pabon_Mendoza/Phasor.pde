class Phasor extends Graph  {
  protected float _x;
  protected float _y;
  protected PVector _final;
  
  public Phasor()  {
    super();
    _final = new PVector(0,0);
  }
  
  protected void draWave()  {
      _x = cos(radians(_ang))*(_mag);
      _y = sin(radians(_ang))*(_mag);
      line(0,0,_x,_y);
      _final.x = _x;
      _final.y = _y;
  
  }
   
  public PVector getFCoord()  {
    return _final;
  }
}
