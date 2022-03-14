final int WIDTH = 700;
final int HEIGHT = 600;
final int TOP_OFFSET = 150;
final int SLAGSCHIP_ONE = 500;
final int CRUISER_ONE = 400;
final int CRUISER_TWO = 401;
final int TORPEDO_HUNTER_ONE = 300;
final int TORPEDO_HUNTER_TWO = 301;
final int TORPEDO_HUNTER_THREE = 302;
final int SUBMARINE_ONE = 200;
final int SUBMARINE_TWO = 201;
final int SUBMARINE_THREE = 202;
final int SUBMARINE_FOUR = 203;
final int MINE = 1;
final int SQUARE_SIZE = 50;
int attempts = 0;
int shipsFound = 0;

int score = 0;
int rows = 10;
int columns = 10;
int[][][] grid = new int[rows][columns][3];

void settings() {
  size(WIDTH, HEIGHT + TOP_OFFSET);
}

int[] targetsPerRow = new int[rows];
int[] targetsPerColumns = new int[columns];


void setup() {
  grid = generateGrid(rows, columns);
  
  layoutOne();
  generateMines();
  
  // bereken per rij hoeveel doelwitten.
  int row = 0;
  while(row != rows) {
    int targets = 0;
    for(int i = 0; i < columns; i += 1) {
      if(grid[i][row][2] > 1) {
        targets += 1;
      }
    }
    targetsPerRow[row] = targets;
    row += 1;
  }
  
  // bereken per colom hoeveel doelwitten.
  int col = 0;
  while(col != columns) {
    int targets = 0;
    for(int i = 0; i < rows; i += 1) {
      if(grid[col][i][2] > 1) {
        targets += 1;
      }
    }
    targetsPerColumns[col] = targets;
    col += 1;
  }
}

void draw() {
  background(255);
  if(shipsFound == 10) {
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(0);
    text("EINDSCHERM", width / 2, 50);
  } else {
    drawScore();
    drawGrid(SQUARE_SIZE, grid);
    textSize(30);
    fill(0);
    for(int i = 0; i < targetsPerRow.length; i += 1) {
      text(targetsPerRow[i], WIDTH - 80, i * 50 + TOP_OFFSET);
    }
    for(int i = 0; i < targetsPerColumns.length; i += 1) {
      text(targetsPerColumns[i], (width / 2) + (i * 50 + 20) - ((grid.length / 2) * 50), TOP_OFFSET - 50);
    }
    //text(targets, WIDTH - 80, grid[2][0][1] * 50 + TOP_OFFSET);
  }
}

void mousePressed() {
  handleSquareClick();
}
