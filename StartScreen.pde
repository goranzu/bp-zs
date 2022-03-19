void startScreen() {
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Enter your name: ", width / 2, 100);
  
  textSize(28);
  textAlign(CENTER, CENTER);
  fill(0);
  text(playerName, width / 2, 150);
  
  //textSize(28);
  //textAlign(CENTER, CENTER);
  //fill(0);
  //text("Choose grid size", width / 2, height / 2 - 100);
  
  //drawGridButtons(width / 2 - 150, height / 2);
  
  //int[] continueButtonSize = {150, 50};
  //drawButton(width / 2, height / 2 + 100, "Continue", continueButtonSize);
}

void drawButton(int xCoord, int yCoord, String text, int[] size) {
  fill(255);
  rectMode(CENTER);
  rect(xCoord, yCoord, size[0], size[1]);
  //rect(xCoord, yCoord, 100, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  text(text, xCoord, yCoord - 6);
}

void drawGridButtons(int startXCoord, int startYCoord) {
  int[] gridButtonSize = {100, 50};
  int gap = 150;
  for(int i = 0; i < gridButtons.length; i += 1) {
    drawButton(startXCoord * i + gap, startYCoord, gridButtons[i], gridButtonSize);
  }
}
