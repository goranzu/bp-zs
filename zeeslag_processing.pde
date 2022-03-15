final int WIDTH = 700;
final int HEIGHT = 600;
final int TOP_OFFSET = 150;
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
final int SQUARE_SIZE = 50;
int attempts = 0;
int shipsFound = 0;

int score = 0;
int rows = 10;
int columns = 10;
int[][][] grid = new int[rows][columns][3];

void settings() {
  size(WIDTH, HEIGHT + TOP_OFFSET);
}

int[] targetsPerRow = new int[rows];
int[] targetsPerColumns = new int[columns];

void setup() {
  grid = generateGrid(rows, columns);
  
  layoutOne();
  generateMines();
  
  // bereken per rij hoeveel doelwitten.
  targetsPerRow = calcTargetsPerRow(rows);
  
  // bereken per colom hoeveel doelwitten.
  targetsPerColumns = calcTargetsPerColumn(columns);
}


String name = "blabla";

void draw() {
  background(255);
  textSize(35);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Enter your name: ", width / 2, 100);
  
  textSize(28);
  textAlign(CENTER, CENTER);
  fill(0);
  text(name, width / 2, 150);
  //if(shipsFound == 10) {
  //  textSize(50);
  //  textAlign(CENTER, CENTER);
  //  fill(0);
  //  text("EINDSCHERM", width / 2, 50);
  //} else {
  //  drawScore();
  //  drawGrid(SQUARE_SIZE, grid);
  //  textSize(30);
  //  fill(0);
  //  drawTargetAmountForRows();
  //  drawTargetAmountForColumns();
  //}
}

void mousePressed() {
  handleSquareClick();
}

void keyPressed() {
  if(key == BACKSPACE && name.length() > 1) {
    println("backspace");
    // probeer iets met substrings.
  } else {
    name += key;
    println(key);
  }
}
