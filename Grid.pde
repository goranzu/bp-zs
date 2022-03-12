void drawGrid(int squareSize, int[][][] grid) {
  final int DEFAULT = #ffffff;
  final int EMPTY_SQUARE = #429ea6;
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int squareState = grid[i][j][2];
      switch (squareState) {
        case 1:
          fill(EMPTY_SQUARE);
          drawSquare(i, j, squareSize);
          break;
        default:
          fill(DEFAULT);
          drawSquare(i, j, squareSize);
      }
    }
  }
}

void drawSquare(int x, int y, int size) {
  float xRect = (width / 2) + (x * size) - ((grid.length / 2) * size);
  float yRect = (y * size);
  rect(xRect, yRect, size, size);
}

int[][][] createGrid(int rows, int cols) {
  int[][][] grid = new int[rows][cols][3];

  for(int i = 0; i < rows; i += 1) {
    for(int j = 0; j < cols; j += 1) {
      grid[i][j][0] = i * SQUARE_SIZE;
      grid[i][j][1] = j * SQUARE_SIZE;
      grid[i][j][2] = 0;
    } 
  }
  
  return grid;
}
