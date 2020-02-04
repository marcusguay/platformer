import fisica.*;
FBox platform, player1;
FBomb bomb=null;
color black = #000000;
PImage map;
int x=0;
int y=0;
float vx,vy;
int gridsize=50;
boolean wkey, akey, skey, dkey,qkey,ekey;
boolean ukey,rkey,lkey,dnkey,uukey,okey;
FWorld world;
ArrayList<FBox> boxes= new ArrayList<FBox>();
void setup() {
  size(600, 600);
  Fisica.init(this);
  world = new FWorld(0,0,10000,10000);
  world.setGravity(0, 980);
  
  map=loadImage("map.png");


player1= new FBox(gridsize,gridsize);
player1.setFill(0);
player1.setPosition(0,0);
world.add(player1);

  while (y < map.height) {



    color c = map.get(x, y);


    if ( c == black) {
      FBox platform = new FBox(gridsize, gridsize);
      platform.setFill(black);
      platform.setPosition(x*gridsize, y*gridsize);
      platform.setStatic(true);
      world.add(platform);
    }

    x++;

    if (x== map.width) {
      x=0;
      y++;
    }
  }
}


void draw() {
  background(255);
  translate(-player1.getX() + width/2 ,-player1.getY()+height/2);
  pushMatrix();
  world.step();
  world.draw();
  popMatrix();
  vx=0;
  
  if(akey) vx=-500;
  if(dkey) vx=500;
  player1.setVelocity(vx,player1.getVelocityY());
  
  if(qkey && bomb==null){
    bomb= new FBomb();
    
  }
  
  if(bomb != null) bomb.act();
  
  
  ArrayList<FContact> contacts =player1.getContacts();
  if(wkey&& contacts.size() > 0) player1.setVelocity(player1.getVelocityX(), -500);
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
