final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
final int TOTAL_LIFE = 5;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered, life;
PImage bg,groundHog, soil8x24,soil0, soil1, soil2, soil3, soil4, soil5, stone1, stone2;

// For debug function; DO NOT edit or remove this!
int playerHealth ;
float cameraOffsetY = 0;
boolean debugMode = false;

float groundHogX;
float groundHogY;
float groundHogW = 80;
float groundHogH = 80;
float soilY=0;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  groundHog= loadImage("img/groundhogIdle.png");
  life = loadImage("img/life.png");
  groundHogX = 320;
  groundHogY = 80;
  playerHealth = 2;
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT+soilY, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!

pushMatrix();
translate(0,160);
for(int i = 0 ; i<24 ;i++){ 
  for(int j = 0 ; j<8 ; j++){
  if (i<4){
   image(soil0,j*80,i*80+soilY);
   }

  if (4<=i && i<8){
   image(soil1,j*80,i*80+soilY);
   }

  if (8<=i && i<12){
   image(soil2,j*80,i*80+soilY);
   }

  if (12<=i && i<16){
   image(soil3,j*80,i*80+soilY);
   }

  if (16<=i && i<20){
   image(soil4,j*80,i*80+soilY);
   }

  if (20<=i && i<24){
   image(soil5,j*80,i*80+soilY);
   }
 
  if(i<8){
  image(stone1,i*80,i*80+soilY);
  }
  if(i==8 || i==11 || i==12 || i==15 ){
   if( j==1 || j==2 || j==5 || j==6){
    image(stone1,j*80,i*80+soilY);
    }
   }
   
  if(i==9 || i==10 || i==13 || i==14 ){
   if( j==0 || j==3 || j==4 || j==7){
    image(stone1,j*80,i*80+soilY);
    }
   }
   
  if(16<=i && i<24){

  image(stone1,width-(i-9)*80,i*80+soilY);
  image(stone1,width-(i-10)*80,i*80+soilY);
  image(stone2,width-(i-10)*80,i*80+soilY);
  
  image(stone1,width-(i-12)*80,i*80+soilY);
  image(stone1,width-(i-13)*80,i*80+soilY);
  image(stone2,width-(i-13)*80,i*80+soilY); 
  
  image(stone1,width-(i-15)*80,i*80+soilY);
  image(stone1,width-(i-16)*80,i*80+soilY);
  image(stone2,width-(i-16)*80,i*80+soilY);
  
  image(stone1,width-(i-18)*80,i*80+soilY);
  image(stone1,width-(i-19)*80,i*80+soilY);
  image(stone2,width-(i-19)*80,i*80+soilY);
  
  image(stone1,width-(i-21)*80,i*80+soilY);
  image(stone1,width-(i-22)*80,i*80+soilY);
  image(stone2,width-(i-22)*80,i*80+soilY);
}

 }

}
popMatrix();



//image(soil8x24, 0, 160);

		// Player
image(groundHog,groundHogX,groundHogY);

		// Health UI
for(int i=0 ; i<TOTAL_LIFE ; i++){

     image(life,10 + 70*i,10);

   
 }


		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case DOWN:
        soilY -=80;
        if(soilY<-1600){
        soilY = -1600;
        groundHogY +=groundHogH;
          if(groundHogY>height-groundHogH){
          groundHogY=height-groundHogH;
          }
        
        }
        break;
      case LEFT:
        groundHogX -= 80;
        break;
      case RIGHT:
        groundHogX += 80;
        break;
    }
  }
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
