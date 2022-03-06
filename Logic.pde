int[][] createGrid(int rows, int cols) {
  int[][] grid = new int[rows][cols];

  for(int i = 0; i < rows; i += 1) {
    for(int j = 0; j < cols; j += 1) {
      // 0 = verborgen
      // sla de positie hier op. In String from "X - Y"
      grid[i][j] = 0;
    } 
  }
  
  return grid;
}
