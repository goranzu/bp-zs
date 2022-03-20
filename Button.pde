String[] gridButtons = {"10x10", "15x15", "25x25"};

String[] getGridButtons() {
  return gridButtons;
}

void drawButton(int x, int y, int w, int h, String text) {
  fill(255);
  rect(x,y,w,h);
  fill(0);
  text(text, x + w / 2, y + h / 2);
  handleButtonClicks(x, y, w, h, text);
}

void handleButtonClicks(int x, int y, int w, int h, String text) {
  if(mousePressed && !gameIsStarted){
    if(isClicked(x, y, w, h)) {
      if(text == "Start") {
        if(getPlayerName().length() < 1) {
          setPlayerName("Player 1");
        }
       gameIsStarted = true;
      } else if(text == "Play again") {
        // handle play again
        loop();
        resetGame();
      } else {
        //gridSize = text;
        setGridSize(text);
      }
    }
  }
}

boolean isClicked(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

 
