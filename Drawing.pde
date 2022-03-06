void drawGrid(int squareSize, int[][] grid) {
  for(int i = 0; i < grid.length; i += 1) {
    //text of niet??
    //text(i, i * squareSize, 10 * 1);
    for(int j = 0; j < grid[i].length; j += 1) {
      float xRect = (width / 2) + (i * squareSize) - ((grid.length / 2) * squareSize);
      float yRect = (j * squareSize);
      rect(xRect, yRect, squareSize, squareSize);
    }
  }
}
