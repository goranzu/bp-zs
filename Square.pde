
void drawSquare(int x, int y, int size) {
  float xRect = (width / 2) + (x * size) - ((grid.length / 2) * size);
  float yRect = (y * size + TOP_OFFSET);
  rect(xRect, yRect, size, size);
}

boolean isBattleship(int squareType) {
  return squareType >= 500 && squareType < 600;
}

boolean isCruiser(int squareType) {
  return squareType >= 400 && squareType < 500;
}

boolean isTorpedoHunter(int squareType) {
  return squareType >= 300 && squareType < 400;
}

boolean isSubmarine(int squareType) {
  return squareType >= 200 && squareType < 300;
}

boolean isSquareRevealed(int isRevealed) {
  return isRevealed == 1;
}

boolean isSquareMine(int squareType) {
  return squareType == 1;
}

boolean isSquareEmpty(int squareType) {
  return squareType == 0;
}

boolean isSquareTarget(int squareType) {
  return squareType > 9;
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

          if(isShipSunk(SLAGSCHIP_ONE) && isBattleship(squareType)) {
            shipsFound += 1;
            score += shipLength(SLAGSCHIP_ONE);
          } else if(isCruiser(squareType)) {
            if(isShipSunk(CRUISER_ONE) || isShipSunk(CRUISER_TWO)) {
              shipsFound += 1;
              score += shipLength(CRUISER_ONE);
            }
          } else if(isTorpedoHunter(squareType)) {
            if(isShipSunk(TORPEDO_HUNTER_ONE) || isShipSunk(TORPEDO_HUNTER_TWO) || isShipSunk(TORPEDO_HUNTER_THREE)) {
              shipsFound += 1;
              score += shipLength(TORPEDO_HUNTER_ONE);
            }
          } else if(isSubmarine(squareType)) {
            if(isShipSunk(SUBMARINE_ONE) ||
               isShipSunk(SUBMARINE_TWO) ||
               isShipSunk(SUBMARINE_THREE) ||
               isShipSunk(SUBMARINE_ONE)) {
              shipsFound += 1;
              score += shipLength(SUBMARINE_ONE);   
             }
          }
          
          //else if((isShipSunk(CRUISER_ONE) && squareType == CRUISER_ONE) ||
          //          (isShipSunk(CRUISER_TWO) && squareType == CRUISER_TWO)) {
          //  shipsFound += 1;
          //  score += shipLength(CRUISER_ONE);
          //} 
          //else if((isShipSunk(TORPEDO_HUNTER_ONE) && squareType == TORPEDO_HUNTER_ONE) ||
          //          (isShipSunk(TORPEDO_HUNTER_TWO) && squareType == TORPEDO_HUNTER_TWO) ||
          //          (isShipSunk(TORPEDO_HUNTER_THREE) && squareType == TORPEDO_HUNTER_THREE)){
          //  shipsFound += 1;
          //  score += shipLength(TORPEDO_HUNTER_ONE);
          //} else if((isShipSunk(SUBMARINE_ONE) && squareType == SUBMARINE_ONE) ||
          //          (isShipSunk(SUBMARINE_TWO) && squareType == SUBMARINE_TWO) ||
          //          (isShipSunk(SUBMARINE_THREE) && squareType == SUBMARINE_THREE) ||
          //          (isShipSunk(SUBMARINE_FOUR) && squareType == SUBMARINE_FOUR)) {
          //  shipsFound += 1;
          //  score += shipLength(SUBMARINE_ONE);
          //}
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
