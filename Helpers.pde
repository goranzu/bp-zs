int calcTopOffset() {
  return height - (size * columns);
}

boolean isClicked(int x, int y, int size) {
  return mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size;
}

// van stack overflow
String[] removeItemFromArray(String[] arr, int n) {
  if (n < arr.length-1) {
    arrayCopy(subset(arr, n+1), 0, arr, n, arr.length-1-n);
  }
  arr = shorten(arr);
  return arr;
}

void resetGame() {
  score = 0;
  attempts = 0;
  shipsFound = 0;
  isGridSet = false;
  gameIsStarted = false;
}
