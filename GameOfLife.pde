import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
private Life[][] buttons; //2d array of Life buttons each representing one cell
  public final static int NUM_COLS = 20;
  public final static int NUM_ROWS = 20;
private boolean[][] buffer; //2d array of booleans to store state of buttons array
private boolean running = true; //used to start and stop program

public void setup () {
  size(400, 400);
  frameRate(6);
  // make the manager
  Interactive.make( this );
  

  //your code to initialize buttons goes here
   buttons = new Life[NUM_ROWS][NUM_COLS];
  for(int r = 0; r < NUM_ROWS; r++)
    for(int c = 0; c < NUM_COLS; c++)
    buttons[r][c] = new Life(r,c);
  //your code to initialize buffer goes here
  buffer = new boolean[NUM_ROWS][NUM_COLS];
 
}

public void draw () {
  background( 0 );
  if (running == false) //pause the program
    return;
  copyFromButtonsToBuffer();

  //use nested loops to draw the buttons here
for(int r = 0; r < NUM_ROWS; r++)
{
    for(int c = 0; c < NUM_COLS; c++)
    {
      if(countNeighbors(r,c) == 3)
      {
        buffer[r][c] = true;
      }
      else if(countNeighbors(r,c) == 2 && buttons[r][c].getLife() == true)
      {
        buffer[r][c] = true;
      }
      else
      {
        buffer[r][c] = false;
      }
    }
