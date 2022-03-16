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

void generateMines(float percentageOfMines) {
  // ik bereken dit 2 keer. onnodig??
  int maxEmptyPositions = (columns * rows) - howManyTargetsOnGrid();
  String[] possibleMineLocations = new String[maxEmptyPositions];
  possibleMineLocations = getEmptySquares();
  
  float amountMines = maxEmptyPositions * percentageOfMines;
  
  for(int i = 0; i < amountMines; i += 1) {
    String location = possibleMineLocations[floor(random(0, maxEmptyPositions))];
    int[] loc = int(split(location, "-"));
    grid[loc[0]][loc[1]][2] = MINE;
  }
}
