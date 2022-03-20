final int WIDTH = 1200;
final int HEIGHT = 700;
final int SLAGSCHIP_ONE = 500;
final int CRUISER_ONE = 400;
final int CRUISER_TWO = 401;
final int TORPEDO_HUNTER_ONE = 300;
final int TORPEDO_HUNTER_TWO = 301;
final int TORPEDO_HUNTER_THREE = 302;
final int SUBMARINE_ONE = 200;
final int SUBMARINE_TWO = 201;
final int SUBMARINE_THREE = 202;
final int SUBMARINE_FOUR = 203;
final int MINE = 1;

String gridSize = "10x10";
int columns;
int rows;
int size;

int[][][] grid = new int[columns][rows][4];

String playerName = "";
int score = 0;
int attempts = 0;
int shipsFound = 0;


boolean gameIsStarted = false;
boolean isGridSet = false;
String[] gridButtons = {"10x10", "15x15", "25x25"};

/*
  aantal colomen en rijen kan ik bereken door de width en eerst 150 van af te trekken
  voor de top offset.
  voor de aanwijzing kijk naar de edges. de laatste in rij + size,
  of eerste in colom + size
  soms kunnen mijnen dezelfde locatie krijgen,
  splice de array om dat te voorkomen
*/ 

void settings() {
  size(WIDTH, HEIGHT);
  
}

void setup() {
  //cols = floor((width - 100) / size);
  //rows = floor((height - 100) / size);
  //grid = makeGrid(columns, rows);
  //layoutOne();
  //generateMines(0.1);
  
  //fill(0);
  //textSize(22);
}

void draw() {
  background(255);
  if(gameIsStarted && shipsFound == 10) {
    // handle end game
    textSize(28);
    fill(0);
    text(playerName + " has " + score + " points", width / 2, 100);
    
    button(width / 2, 200, 150, 50, "Play again");
    
    saveHighscores();
  } else if(gameIsStarted) {
    if(!isGridSet) {
      gameSetup();
    } else {
      drawGrid();
      drawScore();
      
      fill(0);
      textAlign(CENTER);
      drawTargetsPerColumn(columns);
      textAlign(CENTER, CENTER);
      drawTargetsPerRow(rows);
    }
  } else {
    startScreen();
  }
}

void mousePressed() {
  if(gameIsStarted) {
    handleClick();
  }
}

void keyPressed() {
  handleKeyPress();
}
