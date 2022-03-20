void startScreen() {
  String namePrompt = "Enter your name: ";
  int xCoord = width / 2;
  int yCoord = 100;
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(0);
  text(namePrompt, xCoord, yCoord);
  
  textSize(28);
  textAlign(CENTER, CENTER);
  fill(0);
  text(playerName, xCoord, yCoord + 50);
  
  textSize(28);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Choose grid size", xCoord, yCoord + 150);
  
  int startButtonsCoord = xCoord - 150;
  int gap = 150;
  
  for(int i = 0; i < getGridButtons().length; i += 1) {
    drawButton(startButtonsCoord * i + gap, height / 2, 100, 50, getGridButtons()[i]);
  }
  
  drawButton(xCoord, height / 2 + 100, 100, 50, "Start");
}
