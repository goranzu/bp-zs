void drawSquare(int x, int y, int size) {
  float xRect = (width / 2) + (x * size) - ((grid.length / 2) * size);
  float yRect = (y * size + TOP_OFFSET);
  rect(xRect, yRect, size, size);
}
  
boolean isShipSunk(int squareType) {
  //int squareType = 50;
  int boatLength = 0;
  int hits = 0;
  
  switch(squareType) {
    case SLAGSCHIP_ONE:
      boatLength = 4;
      break;
    case CRUISER_ONE:
    case CRUISER_TWO:
      boatLength = 3;
      break;
    case TORPEDO_HUNTER_ONE:
    case TORPEDO_HUNTER_TWO:
    case TORPEDO_HUNTER_THREE:
      boatLength = 2;
      break;
    case SUBMARINE_ONE:
    case SUBMARINE_TWO:
    case SUBMARINE_THREE:
    case SUBMARINE_FOUR:
      boatLength = 1;
      break;

  }
  
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
      if(square[2] == squareType && square[3] == 1) {
        hits += 1;
      }
    }
  }
  
  if(hits == boatLength) {
    return true;
  } else {
    return false;
  }
}

void handleSquareClick() {
  for (int i = 0; i < grid.length; i += 1) {
    for (int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
      if(isSquareClicked(square[0] * SQUARE_SIZE, square[1] * SQUARE_SIZE)) {
        //println(square);
        int squareType = square[2];
        if(square[3] == 0) {
          // vak is onthuld
          square[3] = 1;
          attempts += 1;
          
          if(squareType == MINE) {
            score -= 1;
            return;
          }
          
          // check if ship has been revealed and award points

          if(isShipSunk(SLAGSCHIP_ONE) && squareType == SLAGSCHIP_ONE) {
            shipsFound += 1;
            score += 4;
          } else if((isShipSunk(CRUISER_ONE) && squareType == CRUISER_ONE) ||
                    (isShipSunk(CRUISER_TWO) && squareType == CRUISER_TWO)) {
            shipsFound += 1;
            score += 3;
          } else if((isShipSunk(TORPEDO_HUNTER_ONE) && squareType == TORPEDO_HUNTER_ONE) ||
                    (isShipSunk(TORPEDO_HUNTER_TWO) && squareType == TORPEDO_HUNTER_TWO) ||
                    (isShipSunk(TORPEDO_HUNTER_THREE) && squareType == TORPEDO_HUNTER_THREE)){
            shipsFound += 1;
            score += 2;
          } else if((isShipSunk(SUBMARINE_ONE) && squareType == SUBMARINE_ONE) ||
                    (isShipSunk(SUBMARINE_TWO) && squareType == SUBMARINE_TWO) ||
                    (isShipSunk(SUBMARINE_THREE) && squareType == SUBMARINE_THREE) ||
                    (isShipSunk(SUBMARINE_FOUR) && squareType == SUBMARINE_FOUR)) {
            shipsFound += 1;
            score += 1;
          }
        }
      }
    }
  }
}

boolean isSquareClicked(int xCoord, int yCoord) {
  int offSet = 100; // verander dit. Dit moet berekend worden.
  return (mouseX > xCoord + offSet && mouseX < xCoord + SQUARE_SIZE + offSet) &&
         (mouseY > (yCoord + TOP_OFFSET) && mouseY < (yCoord + TOP_OFFSET) + SQUARE_SIZE);
}
