class Fog{
  float x,y,w,h,b;

  float tfogx,tfogy;
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
tfogx=x;
tfogy=y;
  b=dist(tfogx,tfogy,player1.getX(),player1.getY());
if(b>250){
  b=255;}

}

}
