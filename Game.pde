//boolean gameIsStarted = false;

boolean getGameIsStarted() {
  return gameIsStarted;
}

void setGameIsStarted(boolean start) {
  gameIsStarted = start
}

void gameScreen() {
  drawGrid();
  drawScore();
  
  fill(0);
  textAlign(CENTER);
  drawTargetsPerColumn(getColumns());
  textAlign(CENTER, CENTER);
  drawTargetsPerRow(getRows());
}

void resetGame() {
  setScore(0);
  setAttempts(0);
  setShipsFound(0);
  setIsGridSet(false);
  gameIsStarted = false;
}

void gameSetup() {
  int[] slagSchepen = {getBattleShipOne()};
  int[] cruisers = {getCruiserOne(), getCruiserTwo()};
  int[] torpedoHunters = {getTorpedoHunterOne(), getTorpedoHunterTwo(), getTorpedoHunterThree()};
  int[] submarines = {getSubmarineOne(), getSubmarineTwo(), getSubmarineThree(), getSubmarineFour()};

  int[] gridSplit = int(split(getGridSize(), "x"));
  //columns = gridSplit[0];
  setColumns(gridSplit[0]);
  //rows = gridSplit[1];
  setRows(gridSplit[1]);
  
  if(getColumns() == 10 && getRows() == 10) {
    setSize(50);
  } else if(getColumns() == 15 && getRows() == 15) {
    setSize(35);
  } else if(getColumns() == 25 && getRows() == 25) {
    setSize(20);
  }
  
  setGrid(makeGrid(getColumns(), getRows()));
  
  placeBattleships(slagSchepen);
  placeBattleships(cruisers);
  placeBattleships(torpedoHunters);
  placeBattleships(submarines);
  
  generateMines(0.1);
  
  setIsGridSet(true);
}
