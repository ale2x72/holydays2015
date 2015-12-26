class DotArray {
  ArrayList <Dot> array;


  DotArray(int n) {
    array = new ArrayList<Dot>();
    Dot d;
    for (int i=0; i<n; i++) {
      d = new Dot(new PVector(random(width), random(height)), new PVector(random(-5, 5), random(-5, 5)), 
        random(-PI*.01, PI*.01), random(-PI*.001, PI*.001));
      // settings for the cover picture
      //           d = new Dot(new PVector(random(width), random(height)), new PVector(-2,2), 
      //     random(-PI*.01, PI*.01), random(-PI*.001, PI*.001));
      array.add(d);
    }
  }

  void update() {
    int s = array.size();
    for (int i=0; i< s; i++) {
      Dot d = array.get(i);
      d.update();
    }
    purge();
  }

  void purge() {
    Dot d;
    int s = array.size();
    for (int i=array.size()-1; i>=0; i--) {
      d = (Dot)array.get(i);
      if (!d.alive) array.remove(i);
    }
    if (s-array.size()>0) println(array.size());
  }
}