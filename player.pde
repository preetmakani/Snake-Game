class player {
  PVector pos;
  PVector vel;
  int tailLength;
  ArrayList<PVector> tail;
  boolean dead = true;

  player() {
    int col = floor(width/gridSize);
    int row = floor(height/gridSize);
    pos = new PVector(0, 0);
    pos.set((int)random(col)*gridSize, (int)random(row)*gridSize);
    vel = new PVector();
    tail = new ArrayList<PVector>();
    tailLength = 0;
  }

  void update() {
    tail.add(pos.copy());

    pos.add(vel);

    pos.x = (pos.x + width) % width;
    pos.y = (pos.y + height) % height;
    // pos.x = constrain(pos.x, 0, width-gridSize);
    // pos.y = constrain(pos.y, 0, height-gridSize);

    if (tail.size() > tailLength) {
      tail.remove(0);
    }
    for (PVector p : tail) {
      if (p.x == pos.x && p.y == pos.y) {
        dead = true;
        if (tailLength > highscore) {
          highscore = tailLength;
        }
      }
    }
  }

  void display() {
    noStroke();
    fill(255);
    rect(pos.x, pos.y, gridSize, gridSize);
    for (PVector p : tail) {
      rect(p.x, p.y, gridSize, gridSize);
    }
  }

  boolean scored(PVector food) {
    if (pos.dist(food) == 0) {
      tailLength++;
      return true;
    } else return false;
  }
}