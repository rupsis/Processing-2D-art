
color BackgroundColor = color(135, 175, 175);

// Player
color PlayerColor = color(240, 220, 80);
int PlayerX = 100;
int PlayerY = 50;
int PlayerRadius = 10;
float PlayerMoveValue = 4;
int PlayerMargin = 30;

// Goal
color GoalColor = color(75, 110, 50);
int GoalX = 350;
int GoalY = 50;
int GoalWidth = 75;
int GoalHeight = 150;
float GoalMoveValue = 5;
int GoalMargin = 15;

// Dart 
boolean DartActive = false;
float DartX = 40;
float DartY = 40;
int DartRadius = 6;
float DartMoveValue = 7;
color DartColor = color(195, 35, 85);

// Score
float Score = 0;
float GoalPoints = 100;
float GoalMissPoints = -10;


void setup() {
    size(500, 400);
    smooth();
    noStroke();
}

void draw() { 
    background(BackgroundColor);
    drawPlayer();
    drawGoal();
    drawDart();
    checkScore();
}

void drawPlayer() {
    PlayerY += PlayerMoveValue;
    fill(PlayerColor);
    ellipse(PlayerX, PlayerY, 2*PlayerRadius, 2*PlayerRadius);
    if(((PlayerY + PlayerRadius) >= (height - PlayerMargin)) || (PlayerY - PlayerRadius) <= PlayerMargin){
        PlayerMoveValue = -PlayerMoveValue;
    } 
}

void drawGoal() {
    GoalY += GoalMoveValue;
    fill(GoalColor);
    rect(GoalX, GoalY, GoalWidth, GoalHeight);
    if((GoalY + GoalHeight) > (height - GoalMargin) || (GoalY < GoalMargin)){
        GoalMoveValue = -GoalMoveValue;
    } 
}

void drawDart() {
    // if dart isn't active, don't draw
    if(!DartActive) return;
    DartX += DartMoveValue;
    fill(DartColor);
    ellipse(DartX, DartY, 2*DartRadius, DartRadius);
}

void checkScore() {
    if(!DartActive) return;
    // check if in goal
    if((DartX >= GoalX) && (DartX <= GoalX + GoalWidth) && (DartY >= GoalY) && (DartY <= GoalY + GoalHeight)){
        Score += GoalPoints;
        DartActive = false;
        println("Goal! Score: " + Score);
    } else if((DartX - DartRadius) > width) {
        Score += GoalMissPoints;
        DartActive = false;
        println("Miss! Score: " + Score);
    }
}

void keyTyped() {
    if(key == ' '){
        DartActive = true;
        DartX = PlayerX;
        DartY = PlayerY;
    }
}