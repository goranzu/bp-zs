void drawGrid(int squareSize, int[][][] grid) {
  final int DEFAULT = #ffffff;
  final int EMPTY_SQUARE = #429ea6;
  final int BOAT = #eb1313;
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int squareState = grid[i][j][2];
      int revealed = grid[i][j][3];
      if (squareState == 0 && revealed == 1) {
        fill(EMPTY_SQUARE);
        drawSquare(i, j, squareSize);
      } else if (
                (squareState == SUBMARINE || squareState == TORPEDO_HUNTER) 
                && revealed == 1
                ) {
        fill(BOAT);
        drawSquare(i, j, squareSize);
      } else {
        fill(DEFAULT);
        drawSquare(i, j, squareSize);
      }
    }
  }
}

void drawSquare(int x, int y, int size) {
  float xRect = (width / 2) + (x * size) - ((grid.length / 2) * size);
  float yRect = (y * size + TOP_OFFSET);
  rect(xRect, yRect, size, size);
}

int[][][] generateGrid(int rows, int cols) {
  int[][][] grid = new int[rows][cols][4];

  for(int i = 0; i < rows; i += 1) {
    for(int j = 0; j < cols; j += 1) {
      int[] square = grid[i][j];
      square[0] = i * SQUARE_SIZE;
      square[1] = j * SQUARE_SIZE;
      square[2] = 0; // soort
      square[3] = 0; // 0 = verborgen, 1 = ontdekt
    } 
  }
  
  return grid;
}
