/*
  Armada:
    - 1 Slagschip - 4 vakjes lang
    - 2 Kruisers - 3 vakjes lang
    - 3 Torpedobootjagers - 2 vakjes lang
    - 4 Onderzeerers - 1 vakje in omvang
    
    Geplaatst horizontaal of verticaal
*/

final int SQUARE_SIZE = 50;
final int COLUMNS = 10;
final int ROWS = 10;
final int TOP_OFFSET = 100;
final int SUBMARINE = 40;
final int TORPEDO_HUNTER = 50;
int score = 0;
int[][][] grid;

void settings() {
  size(500, 500 + TOP_OFFSET);
}

void setup() {
  grid = generateGrid(COLUMNS, ROWS);
  generateSubmarines();
  generateTorpedoHunters();
  
  //int direction = floor(random(0, 4));
  //int column = floor(random(0, ROWS + 1));
  //int row = floor(random(0, COLUMNS + 1));
  //int[] square = grid[row][column];
  
  //while(square[2] != 0) {
  //  column = floor(random(0, ROWS + 1));
  //  row = floor(random(0, COLUMNS + 1));
  //}
  
  //square[2] = ONDERZEER;
  
  //println(square);
}

void generateTorpedoHunters() {
  int[] directions = {0, 1, 2, 3};
  for (int i = 0; i < 3; i += 1) {
    
    int direction = floor(random(0, 4));
    int[][] location = new int[2][2];
    
    int column = floor(random(0, ROWS));
    int row = floor(random(0, COLUMNS));
    int[] square = grid[row][column];
    
    while(square[2] != 0) {
      column = floor(random(0, ROWS));
      row = floor(random(0, COLUMNS));
    }
    
    boolean isAtTopEdge = row == 0;
    boolean isAtBottomEdge = row == ROWS;
    boolean isAtLeftEdge = column == 0;
    boolean isRightEdge = column == COLUMNS;
    
    //int direction = floor(random(0, 4));
    //int step = 1;
    
    //int column = floor(random(0, ROWS));
    //int row = floor(random(0, COLUMNS));
    //int[] square = grid[row][column];
  
    //while(square[2] != 0) {
    //  column = floor(random(0, ROWS));
    //  row = floor(random(0, COLUMNS));
    //}
    
    //square[2] = TORPEDO_HUNTER;
  }
}

void generateSubmarines() {
  for (int i = 0; i < 4; i += 1) {
    int column = floor(random(0, ROWS));
    int row = floor(random(0, COLUMNS));
    int[] square = grid[row][column];
  
    while(square[2] != 0) {
      column = floor(random(0, ROWS));
      row = floor(random(0, COLUMNS));
    }
    square[2] = SUBMARINE;
  }
}

void draw() {
  background(255);
  drawGrid(SQUARE_SIZE, grid);
  drawScore();
}

void mousePressed() {
  handleSquareClick();
}
