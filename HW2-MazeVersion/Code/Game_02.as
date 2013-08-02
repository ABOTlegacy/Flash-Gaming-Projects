stop();

/***** Imports *****/
import fl.motion.Color;
import flash.display.MovieClip;
import flash.display.DisplayObject;
import flash.display.Graphics;

/***** Global Variables *****/
var dx,dy:Number;				// Move Magnitued of PlayerDot
var bobbleDirection:Number; 	// Direction to bobble the player
var sceneryDirection:Number;	// Determines If Scenery Moves Forward or Backgwards
var kUp:Boolean = true, kDown:Boolean = true, kLeft:Boolean = true, kRight:Boolean = true;	// Determines which directions the player can move.
var fogXBool:Boolean = true, fogYBool:Boolean = true;
var i:Number;




/***** Keyboard Function Event Listener *****/
function keyDownFunction(event:KeyboardEvent){
	objPlayerBack.visible = false;
	objPlayerFront.visible = false;
	objPlayerRight.visible = false;
	objPlayerLeft.visible = false;
	
	// Move The Player Dot
	if (event.keyCode == 37){			// Left Arrow
		if(kLeft){dx = -2; moveTreesHorizontally();}
		objPlayerLeft.visible = true;
	}else if (event.keyCode == 39){		// Right Arrow
		if(kRight){dx = 2; moveTreesHorizontally();}
		objPlayerRight.visible = true;
	}else if (event.keyCode == 40){		// Down Arrow
		if(kDown){dy = 2; moveTreesVertically();}
		objPlayerFront.visible = true;
	}else if (event.keyCode == 38){		// Up Arrow
		if(kUp){dy = -2; moveTreesVertically();}
		objPlayerBack.visible = true;
	}else{
		dx = 0;
		dy = 0;
		objPlayerBack.visible = true;
	}
	if(dx != 0 || dy != 0){
		sceneryRefresh();
	}
}
function keyUpFunction(event:KeyboardEvent){
	if (event.keyCode == 37){			// Left Arrow
		dx = 0;
	}else if (event.keyCode == 39){		// Right Arrow
		dx = 0;
	}else if (event.keyCode == 38){		// Down Arrow
		dy = 0;
	}else if (event.keyCode == 40){		// Up Arrow
		dy = 0;
	}
}



/***** Update Scenery Functions *****/
function sceneryRefresh():void{
	bobblePlayer();
}

/** Bobble Player Up and Down **/
function bobblePlayer():void{
	// Move the Player Effect
	if(objPlayerBack.y < 320){
		bobbleDirection = 1;
	}else if(objPlayerBack.y > 380){
		bobbleDirection = -1;
	}
	objPlayerBack.y += 10 * bobbleDirection;
	objPlayerFront.y += 10 * bobbleDirection;
	objPlayerLeft.y += 10 * bobbleDirection;
	objPlayerRight.y += 10 * bobbleDirection;
	objShadow.width += bobbleDirection * 5;
}

/** Move Trees **/
function moveTreesHorizontally():void{
	// Places the trees in front or back of the tree array if they are too far off screen
	for (var i:int = 0; i < HorizontalTreeGroup.numChildren; i++){
		if(HorizontalTreeGroup.getChildAt(i).x <= -200){
			HorizontalTreeGroup.getChildAt(i).x = 1200;
		}else if(HorizontalTreeGroup.getChildAt(i).x >= 1200){
			HorizontalTreeGroup.getChildAt(i).x = -200;
		}
		
		HorizontalTreeGroup.getChildAt(i).x += 25 * -dx;
	}
}
function moveTreesOnScreenLeft():void{
	if(kLeft == false && VerticalTreeGroupLeft.x < -400){
		// Set The Trees to Visible
		if(true){
			VerticalTreeGroupLeft.visible = true;
			for(var i:Number = 0; i < VerticalTreeGroupLeft.numChildren; i++){
				if(VerticalTreeGroupLeft.getChildAt(i).width > 220){
					VerticalTreeGroupLeft.getChildAt(i).visible = true;
				}else{
					VerticalTreeGroupLeft.getChildAt(i).visible = false;
				}
			}
		}
		
		// Set X
		VerticalTreeGroupLeft.x += 20;
	}else{
		if(kLeft == true && VerticalTreeGroupLeft.x > -600){
			// Set The Trees to Visible
			if(true){
				VerticalTreeGroupLeft.visible = true;
				for(i = 0; i < VerticalTreeGroupLeft.numChildren; i++){
					if(VerticalTreeGroupLeft.getChildAt(i).width > 220){
						VerticalTreeGroupLeft.getChildAt(i).visible = true;
					}else{
						VerticalTreeGroupLeft.getChildAt(i).visible = false;
					}
				}
			}
			
			// Set X
			VerticalTreeGroupLeft.x -= 20;
		}
	}
}
function moveTreesOnScreenRight():void{
	if(kRight == false && VerticalTreeGroupRight.x > 828){
		// Set The Trees to Visible
		if(true){
			VerticalTreeGroupRight.visible = true;
			for(var i:int = 0; i < VerticalTreeGroupRight.numChildren; i++){
				if(VerticalTreeGroupRight.getChildAt(i).width > 220){
					VerticalTreeGroupRight.getChildAt(i).visible = true;
				}else{
					VerticalTreeGroupRight.getChildAt(i).visible = false;
				}
			}
		}
		
		// Set X
		VerticalTreeGroupRight.x -= 20;
	}else{
		if(kRight == true && VerticalTreeGroupRight.x < 1028){
			// Set The Trees to Visible
			if(true){
				VerticalTreeGroupRight.visible = true;
				for(i = 0; i < VerticalTreeGroupRight.numChildren; i++){
					if(VerticalTreeGroupRight.getChildAt(i).width > 220){
						VerticalTreeGroupRight.getChildAt(i).visible = true;
					}else{
						VerticalTreeGroupRight.getChildAt(i).visible = false;
					}
				}
			}
			
			// Set X
			VerticalTreeGroupRight.x += 20;
		}
	}
}
function moveTreesOnScreenUp():void{
	var c:Color = new Color();
	if(kUp == true && HorizontalTreeGroup.height > 200){
		// Set The Trees to Visible
		if(true){
			VerticalTreeGroupRight.visible = true;
			for(i = 0; i < VerticalTreeGroupRight.numChildren; i++){
				if(VerticalTreeGroupRight.getChildAt(i).width > 220){
					VerticalTreeGroupRight.getChildAt(i).visible = true;
				}else{
					VerticalTreeGroupRight.getChildAt(i).visible = false;
				}
			}
			VerticalTreeGroupLeft.visible = true;
			for(i = 0; i < VerticalTreeGroupLeft.numChildren; i++){
				if(VerticalTreeGroupLeft.getChildAt(i).width > 220){
					VerticalTreeGroupLeft.getChildAt(i).visible = true;
				}else{
					VerticalTreeGroupLeft.getChildAt(i).visible = false;
				}
			}
		}
		
		// Move The Up Trees
		HorizontalTreeGroup.visible = true;
		for(var i:int = 0; i < HorizontalTreeGroup.numChildren; i++){
			HorizontalTreeGroup.getChildAt(i).height -= 10;
			HorizontalTreeGroup.getChildAt(i).width -= 5;
			HorizontalTreeGroup.getChildAt(i).x += 2.5;
			c.setTint(0x000000, Math.abs(HorizontalTreeGroup.getChildAt(i).width - 300) / 200);
			HorizontalTreeGroup.getChildAt(i).transform.colorTransform = c;
		}
	}else{
		if(kUp == false && HorizontalTreeGroup.height < 400){
			// Move The Up Trees
			HorizontalTreeGroup.visible = true;
			for(i = 0; i < HorizontalTreeGroup.numChildren; i++){
				HorizontalTreeGroup.getChildAt(i).height += 10;
				HorizontalTreeGroup.getChildAt(i).width += 5;
				HorizontalTreeGroup.getChildAt(i).x -= 2.5;
				c.setTint(0x000000, Math.abs(HorizontalTreeGroup.getChildAt(i).width - 300) / 200);
				HorizontalTreeGroup.getChildAt(i).transform.colorTransform = c;
			}
		}
	}
}
function moveTreesVertically():void{
	// Places the trees in front or back of the tree array if they are too far off screen
	var c:Color = new Color();
	for (var i:int = 0; i < VerticalTreeGroupRight.numChildren; i++){
		if(VerticalTreeGroupRight.getChildAt(i).height >= 900){
			VerticalTreeGroupRight.getChildAt(i).x -= 200;
			VerticalTreeGroupRight.getChildAt(i).width = 50;
			VerticalTreeGroupRight.getChildAt(i).height = 100;
		}else if(VerticalTreeGroupRight.getChildAt(i).height <= 100){
			VerticalTreeGroupRight.getChildAt(i).x += 200;
			VerticalTreeGroupRight.getChildAt(i).width = 450;
			VerticalTreeGroupRight.getChildAt(i).height = 900;
		}
		
		VerticalTreeGroupRight.getChildAt(i).visible = true;
		VerticalTreeGroupRight.getChildAt(i).height += 25 * -dy;
		VerticalTreeGroupRight.getChildAt(i).width += 12.5 * -dy;
		VerticalTreeGroupRight.getChildAt(i).x += 6.25 * -dy;
		if(VerticalTreeGroupRight.getChildAt(i).height >= 600){
			c.setTint(0x000000, 0);
		}else{
			c.setTint(0x000000, Math.abs(1 - (VerticalTreeGroupRight.getChildAt(i).height - 100) / 500));
		}
		VerticalTreeGroupRight.getChildAt(i).transform.colorTransform = c;
	}
	
	for (i = 0; i < VerticalTreeGroupLeft.numChildren; i++){
		if(VerticalTreeGroupLeft.getChildAt(i).height >= 900){
			VerticalTreeGroupLeft.getChildAt(i).x += 600;
			VerticalTreeGroupLeft.getChildAt(i).width = 50;
			VerticalTreeGroupLeft.getChildAt(i).height = 100;
		}else if(VerticalTreeGroupLeft.getChildAt(i).height <= 100){
			VerticalTreeGroupLeft.getChildAt(i).x -= 600;
			VerticalTreeGroupLeft.getChildAt(i).width = 450;
			VerticalTreeGroupLeft.getChildAt(i).height = 900;
		}
		
		VerticalTreeGroupLeft.getChildAt(i).visible = true;
		VerticalTreeGroupLeft.getChildAt(i).height += 25 * -dy;
		VerticalTreeGroupLeft.getChildAt(i).width += 12.5 * -dy;
		VerticalTreeGroupLeft.getChildAt(i).x += -18.75 * -dy;
		if(VerticalTreeGroupLeft.getChildAt(i).height >= 600){
			c.setTint(0x000000, 0);
		}else{
			c.setTint(0x000000, Math.abs(1 - (VerticalTreeGroupRight.getChildAt(i).height - 100) / 500));
		}
		VerticalTreeGroupLeft.getChildAt(i).transform.colorTransform = c;
	}
}
/***** Movement Of PlayerDot *****/
function moveMarble(){
	if((dx > 0 && kRight == false) || (dx < 0 && kLeft == false)){
		dx = 0;
	}
	if((dy < 0 && kUp == false) || (dy > 0 && kDown == false)){
		dy = 0;
	}
	
	// set new marble location
	shpPlayerDot.x += dx * .25;
	shpPlayerDot.y += dy * .25;

	PlayerDotUp.x += dx * .25;
	PlayerDotUp.y += dy * .25;
	
	PlayerDotRight.x += dx * .25;
	PlayerDotRight.y += dy * .25;
	
	PlayerDotDown.x += dx * .25;
	PlayerDotDown.y += dy * .25;
	
	PlayerDotLeft.x += dx * .25;
	PlayerDotLeft.y += dy * .25;
	
	// Update the boundaries
	kUp = true;
	kRight = true;
	kDown = true;
	kLeft = true;
	
	kUp = checkHit(PlayerDotUp, "NoHorizontal");
	kRight = checkHit(PlayerDotRight, "NoVertical");
	kDown = checkHit(PlayerDotDown, "NoHorizontal");
	kLeft = checkHit(PlayerDotLeft, "NoVertical");
	
	if(shpPlayerDot.x > 220){
		gotoAndPlay(3);
	}
}
function checkHit(hitter, impact):Boolean{
	for (var i:int = 0; i < MiniMaze.numChildren; i++){
		if(hitter.hitTestObject(MiniMaze.getChildAt(i))){
			if(MiniMaze.getChildAt(i).name == impact){
				return false;
			}
		}
	}
	return true;
}



/***** Code For The Game Loop *****/
function gameLoop(event:Event){
	// move the marble
	moveMarble();
	moveTreesOnScreenLeft();
	moveTreesOnScreenRight();
	moveTreesOnScreenUp();
	
	var fogX:Number = Math.random() * 2;
	var fogY:Number = Math.random() * 2;
	if(fogXBool){
		fogX = fogX * -1;
	}
	if(fogYBool){
		fogY = fogY * -1;
	}
	
	if(Foggy.x <= -850 && fogXBool){
		fogXBool = ! fogXBool;
	}else{
		if(Foggy.x >= -50 && !fogXBool){
			fogXBool = ! fogXBool;
		}
	}
	if(Foggy.y <= 200 && fogYBool){
		fogYBool = ! fogYBool;
	}else{
		if(Foggy.y >= 250 && !fogYBool){
			fogYBool = ! fogYBool;
		}
	}
	
	Foggy.x += fogX;
	Foggy.y += fogY;
}



/***** Add Event Listners *****/
function startMaze(){
	// set starting movement of PlayerDot
	dx = 0;
	dy = 0;
	sceneryDirection = 1;
	
	// Add Event Listeners
	this.addEventListener(Event.ENTER_FRAME, gameLoop);
	
	// Keyboard Event Listener
	stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownFunction);
	stage.addEventListener(KeyboardEvent.KEY_UP, keyUpFunction);
	stage.focus = stage;
}




startMaze();