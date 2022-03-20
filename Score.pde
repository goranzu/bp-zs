String playerName = "";
int score = 0;
int attempts = 0;
int shipsFound = 0;

String getPlayerName() {
  return playerName;
}

void setPlayerName(String name) {
  playerName = name;
}

int getScore() {
  return score;
}

void setScore(int sc) {
  score = sc;
}

int getAttempts() {
  return attempts;
}

void setAttempts(int att) {
  attempts = att;
}

int getShipsFound() {
  return shipsFound;
}

void setShipsFound(int ships) {
  shipsFound = ships;
}


void drawScore() {
  final int NAME_FONT_SIZE = 32;
  final int SCORE_FONT_SIZE = 28;
  final int NAME_COLOR = 0;
  final int SCORE_COLOR = #6b6b6b;
  
  textSize(NAME_FONT_SIZE);
  textAlign(CENTER, TOP);
  fill(NAME_COLOR);
  int center = width / 2;
  int yCoord = height - getColumns() * getSize();
  text(getPlayerName(), center / 2, yCoord - 150);
  
  fill(SCORE_COLOR);
  textSize(SCORE_FONT_SIZE);
  text("Score: " + getScore(), center / 2, yCoord - 110);
  
  fill(SCORE_COLOR);
  textSize(16);
  text("Attempts: " + getAttempts(), center / 2, yCoord - 70);
}
