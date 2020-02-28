class enemy extends FCircle {
  int ex, ey, size;
  int jump;
  int timer;
  float cd;
  int directionchangecd;
  float acceleration;
  float direction;
  enemy() {
    super(35);
  }



  enemy(int posx, int posy) {
    super(35);
    ex=posx;
    ey=posy;
    this.setPosition(ex, ey);
    timer=10;
    world.add(this);
  } 





  void act() {
    println(cd);
    if (dist(player1.getX(), player1.getY(), this.getX(), this.getY())< 300) {
      this.setVelocity(direction, -(jump*acceleration));


      if (timer<0) {
        direction=(player1.getX()-this.getX());
      }
    }
    cd--;
    timer--;
    if (timer==0) {
      cd=10;
    }
    if (timer<0) {
      jump=5;
     
      acceleration++;
      if (cd<0) {

        timer=50;
      }
    } else { 
      jump=-5;
    
      acceleration--;
    }
  }  


  void show() {
  }
}
