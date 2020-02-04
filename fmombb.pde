class FBomb extends FCircle {

  int timer;

  FBomb() {
    super(35);
    timer = 60;
    this.setFill(0);
    this.setPosition(player1.getX(), player1.getY() - gridsize);
    world.add(this);
  }




  void act() {
    timer--;
    if (timer==0) {
      explode();
      world.remove(this);
      bomb=null;
    }
  }


  void explode() {
    for (int i =0; i<boxes.size(); i++) {
      FBox b=boxes.get(i);
       
 if (dist(this.getX(), this.getY(), player1.getX(), player1.getY())< 200){
    float vx=this.getX() - player1.getX() *10;
    float vy=this.getY()-player1.getY()*5;
    player1.setVelocity(vx,vy);
  }
      
      
      if (dist(this.getX(), this.getY(), b.getX(), b.getY())< 200) {
        float vx = this.getX() - b.getX()*5;
        float vy = this.getY()- b.getY()*5;
        b.setVelocity(vx,vy);
        b.setStatic(false);
      }
    }
  }
}
