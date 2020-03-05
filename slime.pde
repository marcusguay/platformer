class slime extends enemy{
  
  
  
  slime(int x,int y){
  super(x,y);

      lives=3;
      this.setPosition(x,y);
      world.add(this);
    }
    
    void act(){
     
       super.act();
 direction=(player1.getX()-this.getX());
    if (dist(player1.getX(), player1.getY(), this.getX(), this.getY())< 300) {
      this.setVelocity(direction, 500);
    }

   if (lives<=0){world.remove(this);}
  
}
}
    
  
  
  
  
