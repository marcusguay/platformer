class FBullet extends FCircle{
   float p1d;
  
  
  FBullet(){
    super(10);
     this.setFill(0);
     this.setVelocity(100,0);
    p1d=player1.getX()+gridsize*p1direction;
    this.setPosition(p1d, player1.getY());
    world.add(this);
    
    
  }
  
  
  
  
  void act() {
   this.addImpulse(p1direction*1000,0);
    }
  
  
  
  
  
}