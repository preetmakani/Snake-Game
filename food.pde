class food {
  PVector pos;
  food() {
    pos = new PVector();
  }

  void update() {
    int col = floor(width/gridSize);
    int row = floor(height/gridSize);
    pos.set((int)random(col)*gridSize, (int)random(row)*gridSize);
  }

  void display() {
    fill(255, 0, 0);
    rect(pos.x, pos.y, gridSize, gridSize);
  }
}