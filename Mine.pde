void generateMines(float percentageOfMines) {
  // ik bereken dit 2 keer. onnodig??
  int maxEmptyPositions = (columns * rows) - howManyTargetsOnGrid();
  //String[] possibleMineLocations = new String[maxEmptyPositions];
  String[] possibleMineLocations = getEmptySquares();
  
  
  float amountMines = maxEmptyPositions * percentageOfMines;
  for(int i = 0; i < amountMines; i += 1) {
    int locationIndex = floor(random(0, maxEmptyPositions));
    String location = possibleMineLocations[locationIndex];
    
    if(locationIndex != possibleMineLocations.length - 1) {
      // haal de element weg uit de possibleMineLocations, zodat 2 mijnen niet dezelfde locatie kunnen krijgen
      possibleMineLocations = removeItemFromArray(possibleMineLocations, locationIndex);
    }
    
    // anders krijg ik een indeOutOfBoundsException, want de array wordt kleiner
    maxEmptyPositions -= 1;
    int[] loc = int(split(location, "-"));
    grid[loc[0]][loc[1]][2] = MINE;
  }
}
