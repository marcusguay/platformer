import fisica.*;
FBox platform, player1;
FBomb bomb=null;
color black = #000000;
color green=#0ed145;
PImage map;
int x=0;
int y=0;
int p,k;
int l=0;
float vx,vy;
int fogx=0, fogy=-height*3;
int gridsize=50;
boolean wkey, akey, skey, dkey,qkey,ekey;
boolean ukey,rkey,lkey,dnkey,uukey,okey;
FWorld world;
int p1direction=-1;
ArrayList<Fog> fog;
ArrayList<FBox> boxes= new ArrayList<FBox>();
void setup() {
 
  size(600, 600);
  Fisica.init(this);
  world = new FWorld(0,0,10000,10000);
  world.setGravity(0, 980);
  p=70000;
  k=3;
  fog=new ArrayList<Fog>();
  map=loadImage("map.png");

int j=0;
while(j < 70000){
  fog.add(new Fog());
  fogx = fogx + k;
  
  if(fogx>=width/2 + 50){
   fogx=-width/2 - 50;
   fogy=fogy+2;
    
    
  }
  
 j=j+1; 
}



  while (y < map.height) {



    color c = map.get(x, y);


    if ( c == black) {
      FBox b = new FBox(gridsize, gridsize);
      b.setFill(black);
b.setPosition(x*gridsize, y*gridsize);
   b.setStatic(true);
      world.add(b);
      boxes.add(b);
    }
    
       if ( c == green) {
      FBox jumppad = new FBox(gridsize, gridsize);
      jumppad.setFill(green);
jumppad.setPosition(x*gridsize, y*gridsize);
   jumppad.setStatic(true);
      world.add(jumppad);
      boxes.add(jumppad);
    }
    

    x++;

    if (x== map.width) {
      x=0;
      y++;
    }
 



}
player1= new FBox(gridsize,gridsize);
player1.setFill(#001BFF);
player1.setPosition(0,0);
world.add(player1);
}


void draw() {
   background(#E3E3E3);
  println(p1direction);
  translate(-player1.getX() + width/2 ,-player1.getY()+height/2);
  pushMatrix();
  world.step();
  world.draw();
  popMatrix();
  vx=0;
  
  if(akey){ vx=-500; p1direction=-1;}
  if(dkey){ vx=500; p1direction=1;}

  player1.setVelocity(vx,player1.getVelocityY());
  
  l=0;
  while (l < p) {
    Fog f = fog.get(l); 
   f.show();
   f.act();
    l=l+1;}
  
  if(qkey && bomb==null){
    bomb= new FBomb();
    
  }
  
  if(bomb != null) bomb.act();
  
  
  ArrayList<FContact> contacts =player1.getContacts();
  if(wkey&& contacts.size() > 0) player1.setVelocity(player1.getVelocityX(), -500);
for(FContact p : contacts){
  if(p.contains(platform)){
    
    
    
  }
  
  
  
}

}

public void keyPressed() {
  if (key=='a'|| key=='A') akey = true;
  if (key=='d'|| key=='D') dkey = true;
  if (key=='s'|| key=='S') skey = true;
  if (key=='w'|| key=='W') wkey = true;
    if (key=='q'|| key=='Q') qkey = true;
    if (key=='e'|| key=='E') ekey = true;
  
    if (key=='j'|| key=='J') lkey = true;
  if (key=='l'|| key=='L') rkey = true;
  if (key=='k'|| key=='k') dnkey = true;
  if (key=='i'|| key=='I') ukey = true;
   if (key=='u'|| key=='U') uukey = true;
  if (key=='o'|| key=='O') okey = true;
  
}


public void keyReleased() {
  if (key=='a'|| key=='A') akey = false;
  if (key=='d'|| key=='D') dkey = false;
  if (key=='s'|| key=='S') skey = false;
  if (key=='w'|| key=='W') wkey = false;  
  if (key=='q'|| key=='Q') qkey = false;
  if (key=='e'|| key=='E') ekey = false;
  
    if (key=='j'|| key=='J') lkey = false;
  if (key=='l'|| key=='L') rkey = false;
  if (key=='k'|| key=='k') dnkey = false;
  if (key=='i'|| key=='I') ukey = false;
     if (key=='u'|| key=='U') uukey = false;
  if (key=='o'|| key=='O') okey = false;
}
