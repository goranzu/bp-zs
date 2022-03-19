void handleClick() {
  for (int i = 0; i < grid.length; i += 1) {
    for (int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
      if(isClicked(square[0], square[1], size)) {
        int squareType = square[2];
        if(!isSquareRevealed(square[3])) {
          // onthul vakje
          square[3] = 1;
          attempts += 1;
          
          if(isSquareMine(squareType)) {
            score -= 1;
            return;
          }
          
          // check if ship has been revealed and award points

          // de check of het hele schip ontdekt is en of de vakje waarop geklikt is deze schip ook is.
          // dit is nodig anders worden er extra punten/ontdekte schepen toegekend
          if(isShipSunk(SLAGSCHIP_ONE) && squareType == SLAGSCHIP_ONE) {
            shipsFound += 1;
            score += shipLength(SLAGSCHIP_ONE);
            // mischien voor elke schip type een functie maken?
          } else if((isShipSunk(CRUISER_ONE) && squareType == CRUISER_ONE) ||
                    (isShipSunk(CRUISER_TWO) && squareType == CRUISER_TWO)) {
            shipsFound += 1;
            score += shipLength(CRUISER_ONE);
          } else if((isShipSunk(TORPEDO_HUNTER_ONE) && squareType == TORPEDO_HUNTER_ONE) ||
                    (isShipSunk(TORPEDO_HUNTER_TWO) && squareType == TORPEDO_HUNTER_TWO) ||
                    (isShipSunk(TORPEDO_HUNTER_THREE) && squareType == TORPEDO_HUNTER_THREE)){
            shipsFound += 1;
            score += shipLength(TORPEDO_HUNTER_ONE);
          } else if((isShipSunk(SUBMARINE_ONE) && squareType == SUBMARINE_ONE) ||
                    (isShipSunk(SUBMARINE_TWO) && squareType == SUBMARINE_TWO) ||
                    (isShipSunk(SUBMARINE_THREE) && squareType == SUBMARINE_THREE) ||
                    (isShipSunk(SUBMARINE_FOUR) && squareType == SUBMARINE_FOUR)) {
            shipsFound += 1;
            score += shipLength(SUBMARINE_ONE);
          }
        }
      }
    }
  }
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
