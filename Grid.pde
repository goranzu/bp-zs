int[][][] makeGrid(int cols, int rows) {
  int[][][] grid = new int[cols][rows][4];
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
      square[0] = i * size; // row
      square[1] = j * size + calcTopOffset(); // column
      square[2] = 0; // cellType
      square[3] = 0; // 0 = hidden, 1 = visible
    }
  }
  return grid;
}

void drawGrid() {
  final int DEFAULT_COLOR = #ffffff;
  final int BOAT_HIT_COLOR = #000000;
  final int MINE_COLOR = #eb1313;
  final int EMPTY_SQUARE_COLOR = #429ea6;
  
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
      int squareType = square[2];
      int isRevealed = square[3];
      
      if(isSquareRevealed(isRevealed)) {
        if(isSquareTarget(squareType)) {
          fill(BOAT_HIT_COLOR);
        } else if(isSquareEmpty(squareType)) {
          fill(EMPTY_SQUARE_COLOR);
        } else if(isSquareMine(squareType)) {
          fill(MINE_COLOR);
        }
      } else {
        fill(DEFAULT_COLOR);
      }
      rect(square[0], square[1], size, size);
    }
  }
}

int howManyTargetsOnGrid() {
  int targets = 0;
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      if(isSquareTarget(grid[i][j][2])) {
        targets += 1;
      } 
    }  
  }
  return targets;
}

String[] getEmptySquares() {
  int maxEmptyPositions = (columns * rows) - howManyTargetsOnGrid();
  String[] emptyLocations = new String[maxEmptyPositions];
  
  int index = 0;
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      if(isSquareEmpty(grid[i][j][2])) {
        emptyLocations[index] = i + "-" + j;
        index += 1;
      }
    }
  }  
  return emptyLocations;
}

void drawTargetsPerRow(int rows) {
  int[] targetsPerRow = new int[rows];
  int[][] location = new int[columns][2];

  int row = 0;
  
  while(row != rows) {
    int targets = 0;
    for(int i = 0; i < columns; i += 1) {
      // bij de laatste rij sla de locatie op
      if(i == columns - 1) {
        location[row][0] = grid[i][row][0];
        location[row][1] = grid[i][row][1];
      }
      if(isSquareTarget(grid[i][row][2])) {
        targets += 1;
      }
    }
    targetsPerRow[row] = targets;
    row += 1;
  }
  
  for(int i = 0; i < targetsPerRow.length; i += 1) {
    text(targetsPerRow[i], location[i][0] + size + 20, location[i][1] + (size / 2));
  }
}

void drawTargetsPerColumn(int columns) {
  int[] targetsPerColumns = new int[columns];
  int[][] location = new int[columns][2];

  int col = 0;
  // bereken hoeveel targets per rij en de xCoord en yCoord waar de
  // geplaatst moeten worden
  while(col != columns) {
    int targets = 0;
    for(int i = 0; i < rows; i += 1) {
      // bij de bovenste rij
      if(i == 0) {
        location[col][0] = grid[col][i][0];
        location[col][1] = grid[col][i][1];
      }
      if(isSquareTarget(grid[col][i][2])) {
        targets += 1;
      }
    }
    targetsPerColumns[col] = targets;
    col += 1;
  }
  
  // teken de nummers op de juiste plaats
  for(int i = 0; i < targetsPerColumns.length; i += 1) {
    text(targetsPerColumns[i], location[i][0] + size / 2, location[i][1] - 20);
  }
}

void layoutOne() {
  grid[1][0][2] = SLAGSCHIP_ONE;
  grid[1][1][2] = SLAGSCHIP_ONE;
  grid[1][2][2] = SLAGSCHIP_ONE;
  grid[1][3][2] = SLAGSCHIP_ONE;

  grid[7][6][2] = CRUISER_ONE;
  grid[7][7][2] = CRUISER_ONE;
  grid[7][8][2] = CRUISER_ONE;

  grid[0][8][2] = CRUISER_TWO;
  grid[1][8][2] = CRUISER_TWO;
  grid[2][8][2] = CRUISER_TWO;
  
  grid[1][5][2] = TORPEDO_HUNTER_ONE;
  grid[1][6][2] = TORPEDO_HUNTER_ONE;

  grid[9][2][2] = TORPEDO_HUNTER_TWO;
  grid[9][3][2] = TORPEDO_HUNTER_TWO;

  grid[4][0][2] = TORPEDO_HUNTER_THREE;
  grid[5][0][2] = TORPEDO_HUNTER_THREE;
  
  grid[3][5][2] = SUBMARINE_ONE;
  grid[5][3][2] = SUBMARINE_TWO;
  grid[9][9][2] = SUBMARINE_THREE;
  grid[7][0][2] = SUBMARINE_FOUR;
}
