void drawScore() {
  String playerName = "Player 1";
  final int NAME_FONT_SIZE = 32;
  final int SCORE_FONT_SIZE = 28;
  final int NAME_COLOR = 0;
  final int SCORE_COLOR = #6b6b6b;
  
  textSize(NAME_FONT_SIZE);
  textAlign(CENTER, TOP);
  fill(NAME_COLOR);
  text(playerName, width / 2, 0);
  
  fill(SCORE_COLOR);
  textSize(SCORE_FONT_SIZE);
  text("Score: " + score, width / 2, 40);
  
  fill(SCORE_COLOR);
  textSize(16);
  text("Attempts: " + attempts, width / 2, 75);
}
