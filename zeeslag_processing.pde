/*
  Armada:
    - 1 Slagschip - 4 vakjes lang
    - 2 Kruisers - 3 vakjes lang
    - 3 Torpedobootjagers - 2 vakjes lang
    - 4 Onderzeerers - 1 vakje in omvang
    
    Geplaatst horizontaal of verticaal
*/

final int SQUARE_SIZE = 50;
final int COLUMNS = 10;
final int ROWS = 10;
int[][][] grid = createGrid(COLUMNS, ROWS);

void setup() {
  size(500, 500);
  //int[][] grid = createGrid(COLUMNS, ROWS);
}

void draw() {
  drawGrid(SQUARE_SIZE, grid);
}

void updateCell(int[] cell) {
  switch (cell[2]) {
    case 1:
      fill(0);
      drawSquare(cell[0], cell[1], SQUARE_SIZE);
  }
}

void mousePressed() {
  //println(mouseX, mouseY);
  //println(grid[0][0]);
  handleMouseClick();
}

void handleMouseClick() {
  for (int i = 0; i < grid.length; i += 1) {
    for (int j = 0; j < grid[i].length; j += 1) {
      int[] cell = grid[i][j];
      if(isSquareClicked(cell[0], cell[1])) {
        if (cell[2] == 0) {
          cell[2] = 1;
        }
        println(cell);
      }
    }
  }
}

boolean isSquareClicked(int xCoord, int yCoord) {
  return (mouseX > xCoord && mouseX < xCoord + SQUARE_SIZE) && (mouseY > yCoord && mouseY < yCoord + SQUARE_SIZE);
}
