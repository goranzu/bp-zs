// Zeeslag

// Maak een rooster van 10x10
void setup() {
  size(800, 800);
  int[][] grid = createGrid(10, 10);
  drawGrid(50, grid);
}

void draw() {
  
}

void mousePressed() {
  println(mouseX, mouseY);
}
