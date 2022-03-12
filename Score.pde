void drawScore() {
  String playerName = "Player 1";
  
  textSize(32);
  textAlign(CENTER, TOP);
  fill(0);
  text(playerName, width / 2, 0);
  
  fill(#6b6b6b);
  textSize(28);
  text("Score: " + score, width / 2, 40);
}
