void button(int x, int y, int w, int h, String text) {
  fill(255);
  rect(x,y,w,h);
  fill(0);
  text(text, x + w / 2, y + h / 2);
  if(mousePressed){
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
      if(text == "Start") {
        if(playerName.length() < 1) {
        playerName = "Player 1";
        }
       gameIsStarted = true;
      } else if(text == "Play again") {
        // handle play again
        resetGame();
      } else {
        gridSize = text;
      }
    }
  } 
}
 
