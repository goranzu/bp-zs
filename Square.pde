void handleSquareClick() {
  for (int i = 0; i < grid.length; i += 1) {
    for (int j = 0; j < grid[i].length; j += 1) {
      int[] square = grid[i][j];
      if(isSquareClicked(square[0], square[1])) {
        int isRevealed = square[3];
        int boatId = square[2];
        if(isRevealed == 0) {
          if(boatId == SUBMARINE) {
            score += 1;
          } else if(boatId == TORPEDO_HUNTER) {
            score += 2;
          } 
        }
        square[3] = 1;
      }
    }
  }
}

boolean isSquareClicked(int xCoord, int yCoord) {
  return (mouseX > xCoord && mouseX < xCoord + SQUARE_SIZE) && (mouseY > (yCoord + TOP_OFFSET) && mouseY < (yCoord + TOP_OFFSET) + SQUARE_SIZE);
}
