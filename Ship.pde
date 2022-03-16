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
  
  for(int i = 0; i < grid.length; i += 1) {
    for(int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
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
