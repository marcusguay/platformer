class coin extends FCircle {
  float xpos, ypos;
  coin(float x, float y) {
    super(25);
    xpos=x;
    ypos=y;
    this.setPosition(x, y);
   
    this.setFill(255, 244, 15);
    world.add(this);
  }


  void act() {

 this.setVelocity(0,-9);


    ArrayList<FContact> contacts =this.getContacts();
    for (FContact p : contacts) {

      if (p.contains(player1)) {


        println("lol");
        world.remove(this);
        coins=coins+1;
        coin=null;
      }
    }
  }
}
