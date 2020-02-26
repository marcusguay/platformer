class wall{
  float xx,yy;
  wall(float x,float y){
    xx=x;
    yy=y;
    
  }
  
  void show(){
    fill(222,43,43);
    rect(xx,yy,gridsize,gridsize);
    println(xx,yy);
  }
}
