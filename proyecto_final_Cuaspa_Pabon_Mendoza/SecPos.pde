class SecPos extends Graph  {
  protected float _freq;
  protected float _angle;
  protected float _x;
  protected float _y;
  protected PVector _final;
  
  public SecPos()  {
    super();
    setFreq(2);
    setAngle(0);
    _final = new PVector(0,0);
  }
  
  protected void draWave()  {
      _x = cos(radians(_ang+_angle))*(_mag);
      _y = sin(radians(_ang+_angle))*(_mag);
      line(0,0,_x,_y);
      _final.x = _x;
      _final.y = _y;
      _angle -= _freq;
  
  }
  
  public float frequency()  {
   return _freq; 
  }
  
  public void setFreq(float f)  {
   _freq = f; 
  }
   
  public PVector getFCoord()  {
    return _final;
  }
  
  public float angle()  {
   return _angle; 
  }
  
  public void setAngle(float a)  {
   _angle = a; 
  }
  
}
