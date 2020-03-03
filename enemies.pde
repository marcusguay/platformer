 class enemy extends FCircle {
  int ex, ey, size;
  int jump;
  int timer;
  float cd;
  int directionchangecd;
  float acceleration;
  float direction;
 int lives;


  enemy(int posx, int posy) {
super(35); 
  lives=3;; ex=posx;
    ey=posy;
    this.setPosition(ex, ey);
    timer=10;
    
    world.add(this);
  } 





  void act() {

   

    int i=0;
    ArrayList<FContact> contacts =this.getContacts();
    for (FContact p : contacts) {

      if (p.contains(bullet)) {
      
        lives=lives-1;
        if (lives<=0){
          
          coin= new coin(this.getX(),this.getY());
          coin.act();
            world.remove(this);  
      }
    }}
  }





  void show() {
  }
}
