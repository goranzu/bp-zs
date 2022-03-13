void generateMines() {
  int maxEmptyPositions = (10 * 10) - 20;
  String[] possibleMineLocations = new String[maxEmptyPositions];
  int count = 0;
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      if(grid[i][j][2] == 0) {
        possibleMineLocations[count] = i + "-" + j;
        count += 1;
      }
    }
  }
  
  float amountMines = maxEmptyPositions * 0.1;
  for(int i = 0; i < amountMines; i += 1) {
    String location = possibleMineLocations[floor(random(0, maxEmptyPositions))];
    int[] loc = int(split(location, "-"));
    grid[loc[0]][loc[1]][2] = MINE;
  }
}
