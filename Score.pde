void drawScore() {
  final int NAME_FONT_SIZE = 32;
  final int SCORE_FONT_SIZE = 28;
  final int NAME_COLOR = 0;
  final int SCORE_COLOR = #6b6b6b;
  
  textSize(NAME_FONT_SIZE);
  textAlign(CENTER, TOP);
  fill(NAME_COLOR);
  int center = width / 2;
  int yCoord = height - columns * size;
  text(playerName, center / 2, yCoord - 150);
  
  fill(SCORE_COLOR);
  textSize(SCORE_FONT_SIZE);
  text("Score: " + score, center / 2, yCoord - 110);
  
  fill(SCORE_COLOR);
  textSize(16);
  text("Attempts: " + attempts, center / 2, yCoord - 70);
}
