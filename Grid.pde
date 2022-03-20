String gridSize = "10x10";
int columns;
int rows;
int size;

int[][][] grid = new int[columns][rows][4];

boolean isGridSet = false;

boolean getIsGridSet() {
  return isGridSet;
}

void setIsGridSet(boolean is) {
  isGridSet = is;
}

void setGrid(int[][][] g) {
  grid = g;
}

int[][][] getGrid() {
  return grid;
}

String getGridSize() {
  return gridSize;
}

void setGridSize(String grid) {
  gridSize = grid;
}

int getColumns() {
  return columns;
}

void setColumns(int col) {
  columns = col;
}

int getRows() {
  return rows;
}

void setRows(int r) {
  rows = r;
}

int getSize() {
  return size;
}

void setSize(int s) {
  size = s;
}

int[][][] makeGrid(int cols, int rows) {
  int[][][] grid = new int[cols][rows][4];
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
      square[0] = i * size; // row
      square[1] = j * size + calcTopOffset(); // column
      square[2] = 0; // cellType
      square[3] = 1; // 0 = hidden, 1 = visible
    }
  }
  return grid;
}

void drawGrid() {
  final int DEFAULT_COLOR = #ffffff;
  //final int BOAT_HIT_COLOR = #dddddd;
  final int MINE_COLOR = #eb1313;
  final int EMPTY_SQUARE_COLOR = #429ea6;
  int battleShipColor = 25;
  int cruiserColor = 50;
  int torpedoColor = 75;
  int submarineColor = 100;
  
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
      int squareType = square[2];
      int isRevealed = square[3];
      
      if(isSquareRevealed(isRevealed)) {
        if(isBattleship(squareType)) {
          fill(battleShipColor);
        } else if(isCruiser(squareType)) {
          fill(cruiserColor);
        } else if(isTorpedoHunter(squareType)) {
          fill(torpedoColor);
        } else if(isSubmarine(squareType)) {
          fill(submarineColor);
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
  /*
    Deze methode berekent en tekent de targets per rij.
    Dit doe ik omdat ik in de zelfde loop het aantal targets en de coordinaten voor de tekst bereken.
    Hierdoor leek het mij logischer om alles in een methode te doen.
  */
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
  /*
    Deze methode berekent en tekent de targets per kolom.
    Dit doe ik omdat ik in de zelfde loop het aantal targets en de coordinaten voor de tekst bereken.
    Hierdoor leek het mij logischer om alles in een methode te doen.
  */
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
