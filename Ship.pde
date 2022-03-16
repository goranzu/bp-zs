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
  int boatLength = shipLength(squareType);
  
  int hits = 0;
  
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
