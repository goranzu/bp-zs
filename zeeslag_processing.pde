final int WIDTH = 1200;
final int HEIGHT = 700;

void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  //cols = floor((width - 100) / size);
  //rows = floor((height - 100) / size);
  //grid = makeGrid(columns, rows);
  //layoutOne();
  //generateMines(0.1);
  
  //fill(0);
  //textSize(22);
}

void draw() {
  background(255);
  if(getGameIsStarted() && getShipsFound() == 10) {
    endScreen();
  } else if(getGameIsStarted()) {
    if(!getIsGridSet()) {
      gameSetup();
    } else {
      gameScreen();
    }
  } else {
    startScreen();
  }
}

void mousePressed() {
  if(gameIsStarted) {
    handleClick();
  }
}

void keyPressed() {
  handleKeyPress();
}
