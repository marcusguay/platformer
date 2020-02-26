class Fog {
  float x, y, w, h, b;

  float tfogx, tfogy;
  Fog() {
    x=fogx;
    y=fogy;
    w=100;
  }


  void show() {

    pushMatrix();
    translate(player1.getX(), player1.getY());
    rectMode(CENTER);
    noStroke();
    fill(0, 0, 0, b);
    rect(x, y, k, k);
    popMatrix();
  }

  void act() {
    pushMatrix();
    translate(player1.getX(), player1.getY());
    tfogx=x;
    tfogy=y;
    
    if(dist(x, y, 0, 0)/3.5 > 0){
      b=dist(x, y, 0, 0)/3.5;
    }
    

    
    
    
    
   // if(b<150) {b=10;}
    // if((b>150)&&(b<175)){
   //  b=50;
 //  }
   // if((b>175)&&(b<205)){
   //  b=85;
  // }
    if (b>205) {
      b=255;
    }
    popMatrix();
  }
}
