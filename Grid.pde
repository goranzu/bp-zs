final int DEFAULT_SQUARE = 0;
final int MINE_SQUARE = 1;

int[][][] generateGrid(int rows, int cols) {
  int[][][] grid = new int[rows][cols][4];

  for(int i = 0; i < rows; i += 1) {
    for(int j = 0; j < cols; j += 1) {
      int[] square = grid[i][j];
      // geef de indexes een constante. zodat duidelijker is waar een index voor staat.
      square[0] = i; // welke colom
      square[1] = j; // welke rij
      square[2] = DEFAULT_SQUARE; // type - boat, mijn etc...
      square[3] = 1; // zichtbaar = 1 , onzichtbaar = 0
      //square[4] = 0; // als dit een boot is, wordt dit de lengte van de boot
    } 
  }
  return grid;
}

void drawGrid(int squareSize, int[][][] grid) {
  final int DEFAULT_COLOR = #ffffff;
  final int BOAT_HIT_COLOR = #000000;
  final int MINE_COLOR = #eb1313;
  final int EMPTY_SQUARE_COLOR = #429ea6;
  
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[j][i];
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
      
      drawSquare(j, i, squareSize);
    }
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

int[] calcTargetsPerRow(int rows) {
  int[] targetsPerRow = new int[rows];
  int row = 0;
  
  while(row != rows) {
    int targets = 0;
    for(int i = 0; i < columns; i += 1) {
      if(isSquareTarget(grid[i][row][2])) {
        targets += 1;
      }
    }
    targetsPerRow[row] = targets;
    row += 1;
  }
  
  return targetsPerRow;
}

int[] calcTargetsPerColumn(int columns) {
  int[] targetsPerColumns = new int[columns];

  int col = 0;
  while(col != columns) {
    int targets = 0;
    for(int i = 0; i < rows; i += 1) {
      if(isSquareTarget(grid[col][i][2])) {
        targets += 1;
      }
    }
    targetsPerColumns[col] = targets;
    col += 1;
  }
  
  return targetsPerColumns;
}

void drawTargetAmountForRows() {
  for(int i = 0; i < targetsPerRow.length; i += 1) {
      text(targetsPerRow[i], WIDTH - 80, i * SQUARE_SIZE + TOP_OFFSET);
  }
}

void drawTargetAmountForColumns() {
  for(int i = 0; i < targetsPerColumns.length; i += 1) {
      text(targetsPerColumns[i], (width / 2) + (i * 50 + 20) - ((grid.length / 2) * 50), TOP_OFFSET - 35);
  }
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
