void startScreen() {
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Enter your name: ", width / 2, 100);
  
  textSize(28);
  textAlign(CENTER, CENTER);
  fill(0);
  text(playerName, width / 2, 150);
  
  textSize(28);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Choose grid size", width / 2, height / 2 - 100);
  
  int startButtonsCoord = width / 2 - 150;
  int gap = 150;
  
  for(int i = 0; i < gridButtons.length; i += 1) {
    button(startButtonsCoord * i + gap, height / 2, 100, 50, gridButtons[i]);
  }
  
  button(width / 2, height / 2 + 100, 100, 50, "Start");
}
