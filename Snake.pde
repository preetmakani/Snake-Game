player p;
food f;
int gridSize = 20;
int highscore = 0;
boolean isFoodOnTail = false;

void setup() {
  size(600, 600);
  init();
}

void draw() {
  background(0);
  if (!p.dead) {
    if (frameCount%5 == 0) {
      p.update();
    }
    if (p.scored(f.pos)) {
      f.update();
      isFoodOnTail = true;
      while (isFoodOnTail) {
        isFoodOnTail = false;
        for (PVector p : p.tail) {
          if (p.x == f.pos.x && p.y == f.pos.y) {
            isFoodOnTail = true;
          }
        }
      }
    }

    p.display();
    f.display();

    textAlign(LEFT);
    fill(255);
    text("Score: " + p.tailLength, width-100, 20);
  } else {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Snake\nClick to Start\nHighscore: " + highscore, width/2, height/2);
  }
}

void keyPressed() {
  if (keyCode == UP || keyCode == 'W' && p.vel.y != 1*gridSize) {
    p.vel.set(0, -1*gridSize);
  } else if (keyCode == DOWN || keyCode == 'S' && p.vel.y != -1*gridSize) {
    p.vel.set(0, 1*gridSize);
  } else if (keyCode == LEFT || keyCode == 'A' && p.vel.x != 1*gridSize) {
    p.vel.set(-1*gridSize, 0);
  } else if (keyCode == RIGHT || keyCode == 'D' && p.vel.x != -1*gridSize) {
    p.vel.set(1*gridSize, 0);
  }
}

void mousePressed() {
  if (p.dead) {
    init();
    p.dead = false;
  }
}

void init() {
  p = new player();
  f = new food();
  f.update();
}