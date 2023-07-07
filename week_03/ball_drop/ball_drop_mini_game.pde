
color BackgroundColor = color(240, 230, 190);
color BallColor = color(240, 90, 85);
color WallColor = color(120, 150, 165);

float BallX = 100;
float BallStartingY = 100;
float BallY = BallStartingY;
float BallRadius = 30;
float BallSpeed = 5;

float WallHeight = 100;
float GapLeft = 300;
float GapWidth = 150;
float GapRight = GapLeft + GapWidth;

boolean BallIsDropping = false;

float Score = 0;
float GoalPoints = 10;
float MissPoints = 5;

void setup() {
  
  // create the window. This then gives us the global "height" and "width" variables
  size(800, 400);
  smooth();
  noStroke();
}

void draw() {
  moveBall();
  testBall();
  drawEverything();

}

void moveBall() {
  if(BallIsDropping){
    BallY += BallSpeed;
  } else {
    BallX += BallSpeed;
  }
}

void testBall(){
  if(BallIsDropping){
    if(BallY - BallRadius > height){
        if((BallX - BallRadius > GapLeft) && (BallX + BallRadius < GapRight)){
          println("Goal!");
          Score += GoalPoints;
        } else {
          println("miss");
        Score -= MissPoints;
        }
        println("Score: " + Score);
        BallX = 0;
        BallIsDropping = false;
        BallY = BallStartingY;
    }

  } else {
    if(BallX-BallRadius > width){
      BallX = 0;
    }
  }
}

void drawEverything(){
  background(BackgroundColor);

  fill(WallColor);
  rect(0, height - WallHeight, GapLeft, WallHeight);
  rect(GapRight, height - WallHeight, width-GapRight, WallHeight);

  fill(BallColor);
  ellipse(BallX, BallY, BallRadius*2, BallRadius*2);
}


void keyTyped() {
  if (key == ' '){
    BallIsDropping = true;
  }
}
