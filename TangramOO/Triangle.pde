class Triangle extends Shape {
  float edge;

  Triangle() {
    setEdge(100);
  }
  
  Triangle(int tam){
    setEdge(tam);
  }

  @Override
    void drawShape() {
    triangle( 0, 0, edge(), 0, 0, -edge());
  }
  /*@Override
   public abstract boolean grabsInput(float x, float y){
   if(tg1){
   grabsInput=true;
   }
   }*/

  public float edge() {
    return edge;
  }

  public void setEdge(float e) {
    edge = e;
  }
}
