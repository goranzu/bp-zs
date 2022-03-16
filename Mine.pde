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
