int calcTopOffset() {
  return height - (size * columns);
}

boolean isClicked(int x, int y, int size) {
  return mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size;
}

// van stack overflow
String[] removeItemFromArray(String[] arr, int n) {
  if (n < arr.length-1) {
    arrayCopy(subset(arr, n+1), 0, arr, n, arr.length-1-n);
  }
  arr = shorten(arr);
  return arr;
}

void resetGame() {
  score = 0;
  attempts = 0;
  shipsFound = 0;
  isGridSet = false;
  gameIsStarted = false;
}

void gameSetup() {
// op default staat de grid op 10x10
  int[] gridSplit = int(split(gridSize, "x"));
  columns = gridSplit[0];
  rows = gridSplit[1];
  
  if(columns == 10 && rows == 10) {
    size = 50;
  } else if(columns == 15 && rows == 15) {
    size = 40;
  } else if(columns == 25 && rows == 25) {
    size = 20;
  }
  
  grid = makeGrid(columns, rows);
  layoutOne();
  generateMines(0.1);
  
  isGridSet = true;
}

void saveHighscores() {
  //String scoreString = str(score);
    String fileName = "highScores.txt";
    String[] loadedHighscores = loadStrings(fileName);
    String highscore = playerName + "-" + score;
    
    String[] highScores = append(loadedHighscores, highscore);
    
    //for(int i = 0; i < highScores.length; i += 1) {
    //  String[] s1 = split(highScores[i], "-");
    //  int score1 = int(s1[1]);
    //  for(int j = i + 1; j < highScores.length; j += 1) {
    //    String[] s2 = split(highScores[j], "-");
    //    int score2 = int(s2[1]);
    //    if(score2 > score1) {
    //      highScores[i] = highScores[j];
    //    }
    //  }
    //}
    
    if(highScores.length > 10) {
      highScores = shorten(highScores);
    }
    
    saveStrings(fileName, highScores);
}

void handleKeyPress() {
  if(!gameIsStarted) {
    if(key == BACKSPACE && playerName.length() > 1) {
      playerName = playerName.substring(0, playerName.length() - 1);
    } else if(key == BACKSPACE) {
      playerName = "";
    } else if(key == SHIFT) {
      return;
    } else {
      playerName += key;
    }
  }
}
