void endScreen() {
  // handle end game
  textSize(28);
  fill(0);
  text(getPlayerName() + " has " + getScore() + " points", width / 2, 100);
  
  drawButton(width / 2, 200, 150, 50, "Play again");
  
  saveHighscores();
}
