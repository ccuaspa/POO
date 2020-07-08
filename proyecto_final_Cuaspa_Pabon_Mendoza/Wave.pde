class Wave extends Graph  {
  protected float _freq;
  protected float x;
  protected float y;
  protected PVector _final;
  
  
  public Wave()  {
    super();
    setFreq(2);
    _final = new PVector(0,0);
  }
  
  protected void draWave()  {
    for (int i = 0; i< 600; i++) {
      x = cos(radians(_ang))*(_mag);
      y = sin(radians(_ang))*(_mag);
      point(i, y);
      _ang -= _freq;

      }
    _ang = 0;
    _final.x = x;
    _final.y = y;
  
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

}
