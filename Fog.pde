class Fog{
  float x,y,w,h,b;
  float tfogx,tfgy;
  Fog(){
    x=fogx;
    y=fogy;
    w=100;
   
  }
  

void show(){

  pushMatrix();
    translate(player1.getX(),player1.getY());
  rectMode(CENTER);
  noStroke();
 fill(0,0,0,b);
rect(x,y,k,k);
popMatrix();
}

void act(){

  b=dist(player1.getX(),player1.getY(),player1.getX()-x,player1.getY()-y)/6.25;
if(b>250){
  b=255;}

}

}
