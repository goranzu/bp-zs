void handleClick() {
  for (int i = 0; i < getGrid().length; i += 1) {
    for (int j = 0; j < getGrid()[i].length; j += 1) {
      int[] square = getGrid()[i][j];
      if(isClicked(square[0], square[1], getSize(), getSize())) {
        int squareType = square[2];
        if(!isSquareRevealed(square[3])) {
          // onthul vakje
          square[3] = 1;
          //attempts += 1;
          setAttempts(getAttempts() + 1);
          
          if(isSquareMine(squareType)) {
            //score -= 1;
            setScore(getScore() - 1);
            return;
          }
          
          // check if ship has been revealed and award points

          // de check of het hele schip ontdekt is en of de vakje waarop geklikt is deze schip ook is.
          // dit is nodig anders worden er extra punten/ontdekte schepen toegekend
          if(isShipSunk(getBattleShipOne()) && squareType == getBattleShipOne()) {
            //shipsFound += 1;
            setShipsFound(getShipsFound() + 1);
            setScore(getScore() + shipLength(getBattleShipOne()));
            //score += shipLength(SLAGSCHIP_ONE);
            // mischien voor elke schip type een functie maken?
          } else if((isShipSunk(getCruiserOne()) && squareType == getCruiserOne()) ||
                    (isShipSunk(getCruiserTwo()) && squareType == getCruiserTwo())) {
            //shipsFound += 1;
            setShipsFound(getShipsFound() + 1);

            //score += shipLength(CRUISER_ONE);
            setScore(getScore() + shipLength(getCruiserOne()));

          } else if((isShipSunk(getTorpedoHunterOne()) && squareType == getTorpedoHunterOne()) ||
                    (isShipSunk(getTorpedoHunterTwo()) && squareType == getTorpedoHunterOne()) ||
                    (isShipSunk(getTorpedoHunterOne()) && squareType == getTorpedoHunterOne())){
            //shipsFound += 1;
            setShipsFound(getShipsFound() + 1);

            //score += shipLength(TORPEDO_HUNTER_ONE);
            setScore(getScore() + shipLength(getTorpedoHunterOne()));

          } else if((isShipSunk(getSubmarineOne()) && squareType == getSubmarineOne()) ||
                    (isShipSunk(getSubmarineTwo()) && squareType == getSubmarineTwo()) ||
                    (isShipSunk(getSubmarineThree()) && squareType == getSubmarineThree()) ||
                    (isShipSunk(getSubmarineFour()) && squareType == getSubmarineFour())) {
            //shipsFound += 1;
            setShipsFound(getShipsFound() + 1);

            //score += shipLength(SUBMARINE_ONE);
            setScore(getScore() + shipLength(getSubmarineOne()));

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
