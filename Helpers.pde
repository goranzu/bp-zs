int calcTopOffset() {
  return height - (getSize() * getColumns());
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

boolean everyHorSquareIsEmpty(int row, int col, int target) {
  //boolean empty = true;
  for(int i = row; i < row + target; i += 1) {
    if(!isSquareEmpty(getGrid()[i][col][2])) {
      return false;
    }
  }
  return true;
}

boolean everyVertSquareIsEmpty(int row, int col, int target) {
  //boolean empty = true;
  for(int i = col; i < col + target; i += 1) {
    if(!isSquareEmpty(getGrid()[row][i][2])) {
      return false;
    }
  }
  return true;
}

boolean hasRightSpace(int startSquare, int amountSquares) {
  return startSquare + amountSquares <= getRows();
}

boolean hasTopSpace(int startSquare, int amountSquares) {
  return startSquare + amountSquares <= getColumns();
}

void saveHighscores() {
  //String scoreString = str(score);
    String fileName = "highScores.txt";
    String[] loadedHighscores = loadStrings(fileName);
    String highscore = getPlayerName() + "-" + getScore();
    
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
    if(key == BACKSPACE && getPlayerName().length() > 1) {
      setPlayerName(getPlayerName().substring(0, getPlayerName().length() - 1));
    } else if(key == BACKSPACE) {
      //playerName = "";
      setPlayerName("");
    } else if(key == SHIFT || key == ENTER || key == RETURN) {
      return;
    } else {
      //playerName += key;
      setPlayerName(getPlayerName() + key);
    }
  }
}
