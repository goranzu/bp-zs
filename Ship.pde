int getBattleShipOne() {
  return 500;
}

int getCruiserOne() {
  return 400;
}

int getCruiserTwo() {
  return 401;
}

int getTorpedoHunterOne() {
  return 300;
}

int getTorpedoHunterTwo() {
  return 301;
}

int getTorpedoHunterThree() {
  return 302;
}

int getSubmarineOne() {
  return 200;
}

int getSubmarineTwo() {
  return 201;
}

int getSubmarineThree() {
  return 203;
}

int getSubmarineFour() {
  return 204;
}

void placeBattleships(int[] shipArray) {
String[] emptyLocations = getEmptySquares();
  int maxEmptyPositions = (getColumns() * getRows()) - howManyTargetsOnGrid();
  
  for(int x = 0; x < shipArray.length; x += 1) {
    while(true) {
      boolean horizontal = floor(random(0, 2)) == 0;
      int locationIndex = floor(random(0, maxEmptyPositions));
      String location = emptyLocations[locationIndex];
      int[] loc = int(split(location, "-"));
      int row = loc[0];
      int col = loc[1];
      int shipLen = shipLength(shipArray[x]);
      
      if(!horizontal && hasTopSpace(col, shipLen) && everyVertSquareIsEmpty(row, col, shipLen)) {
        for(int i = col; i < col + shipLen; i += 1) {
          getGrid()[row][i][2] = shipArray[x];
          emptyLocations = removeItemFromArray(emptyLocations, locationIndex);
          maxEmptyPositions -= 1;
        }
        break;
      } else if(horizontal && hasRightSpace(row, shipLen) && everyHorSquareIsEmpty(row, col, shipLen)) {
        for(int i = row; i < row + shipLen; i += 1) {
            getGrid()[i][col][2] = shipArray[x];
            emptyLocations = removeItemFromArray(emptyLocations, locationIndex);
            maxEmptyPositions -= 1;
          }
        break;
      } else {
        continue;
      }
    }
  }
}

int shipLength(int shipType) {
  if(isBattleship(shipType)) {
    return 4;
  } else if(isCruiser(shipType)) {
    return 3;
  } else if(isTorpedoHunter(shipType)) {
    return 2;    
  } else if(isSubmarine(shipType)) {
    return 1;    
  } else {
    return 0;
  }
}

boolean isShipSunk(int squareType) {
  // bereken de schip lengte
  int shipLength = shipLength(squareType);
  
  // tel hoevaak een schip is geraakt(revealed).
  int hits = 0;
  
  for(int i = 0; i < getGrid().length; i += 1) {
    for(int j = 0; j < getGrid()[i].length; j += 1) {
      int[] square = getGrid()[i][j];
      boolean shipIsHit = square[2] == squareType;
      if(shipIsHit && isSquareRevealed(square[3])) {
        hits += 1;
      }
    }
  }
  
  if(hits == shipLength) {
    return true;
  } else {
    return false;
  }
}
