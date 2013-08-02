stop();

/***** Imports *****/
import fl.motion.Color;
import flash.display.MovieClip;
import flash.display.DisplayObject;
import flash.display.Graphics;


/***** Global Variables *****/
var dx,dy,dz:Number;				// Move Magnitued of Player
var i:Number;
var cutsceneTimer:Timer = new Timer(10);
cutsceneTimer.addEventListener(TimerEvent.TIMER, cutsceneController);
var cutsceneCounter:Number = 0;
var cutsceneString:String = "done";
var checkpoints:Array = new Array(false, false, false);
var PokemonCrys:Array = new Array(new GyaradosCry(), new LaprasCry(), new OnixCry(), new RattataCry());

/***** Keyboard Function Event Listener *****/
function keyDownFunction(event:KeyboardEvent){
	// Move The Player Dot
	if (event.keyCode == 37){			// Left Arrow
		dx = -1;
	}else if (event.keyCode == 39){		// Right Arrow
		dx = 1;
	}else if (event.keyCode == 40){		// Down Arrow
		dy = -1;
	}else if (event.keyCode == 38){		// Up Arrow
		dy = 1;
	}else{
		dx = 0;
		dy = 0;
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


/***** Moves All The Pokemon *****/
function moveThePokemon(){
	for(i = 0; i < Pokemon.numChildren; i++){
		if((Pokemon.getChildAt(i) != Pokemon.getChildByName("BrockA"))){
			// Check For Hit
			if(TheShadow.hitTestObject(DisplayObjectContainer(Pokemon.getChildAt(i)).getChildAt(0))){
				trace("BATMAN: " + Pokemon.getChildAt(i).name);
				cutsceneSet("RunFrom" + Pokemon.getChildAt(i).name.substring(0, 1));
			}
			
			// Moves The Pokemon
			if(Pokemon.getChildAt(i).visible){
				if(Pokemon.getChildAt(i).x < -600){
					Pokemon.getChildAt(i).x = 1300;
					Pokemon.getChildAt(i).visible = false;
				}else{
					Pokemon.getChildAt(i).x -= parseInt(Pokemon.getChildAt(i).name.substring(6, 8));
				}
			}else{
				if(Math.random() > .98){
					Pokemon.getChildAt(i).visible = true;
				}
			}
			
			// Adjust Layers
			if(MovieClip(Pokemon.getChildAt(i)).y < MovieClip(Pokemon.getChildByName("BrockA")).y){
				Pokemon.setChildIndex(MovieClip(Pokemon.getChildByName("BrockA")), Pokemon.getChildIndex(Pokemon.getChildAt(i)));
			}
		}
	}
	var choosen:Number = Math.round(Math.random() * 200);
	if(choosen < 4 && cutsceneString == "done"){
		PokemonCrys[choosen].play();
	}
}

function checkTheLadies(){
	if(! checkpoints[0] && TheShadow.hitTestObject(Field.getChildByName("ShadowJenny"))){
		Field.getChildByName("XJenny").visible = true;
		checkpoints[0] = true;
		cutsceneSet("BrockLove");
	}
	if(! checkpoints[1] && TheShadow.hitTestObject(Field.getChildByName("ShadowSisters"))){
		Field.getChildByName("XSisters").visible = true;
		checkpoints[1] = true;
		cutsceneSet("BrockLove");
	}
	if(! checkpoints[2] && TheShadow.hitTestObject(Field.getChildByName("ShadowJoy"))){
		Field.getChildByName("XJoy").visible = true;
		checkpoints[2] = true;
		cutsceneSet("BrockLove");
	}
	if(checkpoints[0] && checkpoints[1] && checkpoints[2] && cutsceneString == "done"){
		this.removeEventListener(Event.ENTER_FRAME, startGame);
		gotoAndPlay(3);
	}
}




/***** Performs the movement of scenery or player *****/
function moveThePlayer(){
	if(dz < 3){
		dz++;
		
		// Move player horizontally
		if(dx != 0){
			MovieClip(Pokemon.getChildByName("BrockA")).x += dx * 40;
			TheShadow.x += dx * 40;
		}
		
		// Move player vertically by moving the field
		if(dy != 0){
			Field.y += dy * 10;
			Pokemon.y += dy * 10;
			MovieClip(Pokemon.getChildByName("BrockA")).y += dy * -10;
			TheShadow.x += dx * 40;
		}
	}else{
		dx = 0;
		dy = 0;
		dz = 0;
	}
}




/***** Cut Scenes *****/
function cutsceneSet(str){
	reset();
	cutsceneString = str;
	cutsceneTimer.start();
}
function cutsceneController(event:TimerEvent){
	if(cutsceneString == "done"){
		cutsceneCounter = 0;
		resetCutScenes();
		cutsceneTimer.stop();
	}else{
		cutsceneCounter++;
		if(cutsceneString.substring(0, 7) == "RunFrom"){
			if(cutsceneCounter < 130){
				if(cutsceneString.substring(7, 8) == "G"){
					resetCutScenes();
					if((cutsceneCounter > 0 && cutsceneCounter <= 10) || (cutsceneCounter > 40 && cutsceneCounter <= 50) || (cutsceneCounter > 80 && cutsceneCounter <= 90)){
						CutScene_RunFromG01.visible = true;
					}else if((cutsceneCounter > 10 && cutsceneCounter <= 20) || (cutsceneCounter > 50 && cutsceneCounter <= 60) || (cutsceneCounter > 90 && cutsceneCounter <= 100)){
						CutScene_RunFromG02.visible = true;
					}else if((cutsceneCounter > 20 && cutsceneCounter <= 30) || (cutsceneCounter > 60 && cutsceneCounter <= 70 || (cutsceneCounter > 100 && cutsceneCounter <= 110))){
						CutScene_RunFromG03.visible = true;
					}else if((cutsceneCounter > 30 && cutsceneCounter <= 40) || (cutsceneCounter > 70 && cutsceneCounter <= 80) || (cutsceneCounter > 110 && cutsceneCounter <= 120)){
						CutScene_RunFromG02.visible = true;
					}
				}else if(cutsceneString.substring(7, 8) == "L"){
					resetCutScenes();
					if((cutsceneCounter > 0 && cutsceneCounter <= 10) || (cutsceneCounter > 40 && cutsceneCounter <= 50) || (cutsceneCounter > 80 && cutsceneCounter <= 90)){
						CutScene_RunFromL01.visible = true;
					}else if((cutsceneCounter > 10 && cutsceneCounter <= 20) || (cutsceneCounter > 50 && cutsceneCounter <= 60) || (cutsceneCounter > 90 && cutsceneCounter <= 100)){
						CutScene_RunFromL02.visible = true;
					}else if((cutsceneCounter > 20 && cutsceneCounter <= 30) || (cutsceneCounter > 60 && cutsceneCounter <= 70 || (cutsceneCounter > 100 && cutsceneCounter <= 110))){
						CutScene_RunFromL03.visible = true;
					}else if((cutsceneCounter > 30 && cutsceneCounter <= 40) || (cutsceneCounter > 70 && cutsceneCounter <= 80) || (cutsceneCounter > 110 && cutsceneCounter <= 120)){
						CutScene_RunFromL02.visible = true;
					}
				}else if(cutsceneString.substring(7, 8) == "O"){
					resetCutScenes();
					if((cutsceneCounter > 0 && cutsceneCounter <= 10) || (cutsceneCounter > 40 && cutsceneCounter <= 50) || (cutsceneCounter > 80 && cutsceneCounter <= 90)){
						CutScene_RunFromO01.visible = true;
					}else if((cutsceneCounter > 10 && cutsceneCounter <= 20) || (cutsceneCounter > 50 && cutsceneCounter <= 60) || (cutsceneCounter > 90 && cutsceneCounter <= 100)){
						CutScene_RunFromO02.visible = true;
					}else if((cutsceneCounter > 20 && cutsceneCounter <= 30) || (cutsceneCounter > 60 && cutsceneCounter <= 70 || (cutsceneCounter > 100 && cutsceneCounter <= 110))){
						CutScene_RunFromO03.visible = true;
					}else if((cutsceneCounter > 30 && cutsceneCounter <= 40) || (cutsceneCounter > 70 && cutsceneCounter <= 80) || (cutsceneCounter > 110 && cutsceneCounter <= 120)){
						CutScene_RunFromO02.visible = true;
					}
				}else if(cutsceneString.substring(7, 8) == "R"){
					resetCutScenes();
					if((cutsceneCounter > 0 && cutsceneCounter <= 10) || (cutsceneCounter > 40 && cutsceneCounter <= 50) || (cutsceneCounter > 80 && cutsceneCounter <= 90)){
						CutScene_RunFromR01.visible = true;
					}else if((cutsceneCounter > 10 && cutsceneCounter <= 20) || (cutsceneCounter > 50 && cutsceneCounter <= 60) || (cutsceneCounter > 90 && cutsceneCounter <= 100)){
						CutScene_RunFromR02.visible = true;
					}else if((cutsceneCounter > 20 && cutsceneCounter <= 30) || (cutsceneCounter > 60 && cutsceneCounter <= 70 || (cutsceneCounter > 100 && cutsceneCounter <= 110))){
						CutScene_RunFromR03.visible = true;
					}else if((cutsceneCounter > 30 && cutsceneCounter <= 40) || (cutsceneCounter > 70 && cutsceneCounter <= 80) || (cutsceneCounter > 110 && cutsceneCounter <= 120)){
						CutScene_RunFromR02.visible = true;
					}
				}
			}else{
				cutsceneString = "done";
			}
		}else if(cutsceneString.substring(0, 9) == "BrockLove"){
			if(cutsceneCounter == 1){
				CutScene_BrockLove01.visible = true;
				BackgroundSounds[3].play()
			}else if(cutsceneCounter == 100){
				CutScene_BrockLove02.visible = true;
			}else if(cutsceneCounter == 200){
				CutScene_BrockLove03.visible = true;
			}else if(cutsceneCounter == 300){
				cutsceneString = "done";
			}
		}
	}
}
function resetCutScenes(){
	// Run From Pokemon
	CutScene_RunFromG01.visible = false;
	CutScene_RunFromG02.visible = false;
	CutScene_RunFromG03.visible = false;
	CutScene_RunFromL01.visible = false;
	CutScene_RunFromL02.visible = false;
	CutScene_RunFromL03.visible = false;
	CutScene_RunFromO01.visible = false;
	CutScene_RunFromO02.visible = false;
	CutScene_RunFromO03.visible = false;
	CutScene_RunFromR01.visible = false;
	CutScene_RunFromR02.visible = false;
	CutScene_RunFromR03.visible = false;
	
	// Brock Love
	CutScene_BrockLove01.visible = false;
	CutScene_BrockLove02.visible = false;
	CutScene_BrockLove03.visible = false;
}


/***** Resets the Field Back *****/
function reset(){
	Field.y = -613;
	Pokemon.y = -173;
	Pokemon.getChildByName("BrockA").y = 544;
	resetCutScenes();
}




/***** Code For The Game Loop *****/
function gameLoop(event:Event){
	// perform continuous functions
	moveThePlayer();
	moveThePokemon();
	checkTheLadies();
}




/***** Add Event Listners *****/
function startGame(){
	// set starting movement of Player
	dx = 0;
	dy = 0;
	dz = 0;
	
	// Add Event Listeners
	this.addEventListener(Event.ENTER_FRAME, gameLoop);
	
	// Keyboard Event Listener
	stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownFunction);
	stage.addEventListener(KeyboardEvent.KEY_UP, keyUpFunction);
	stage.focus = stage;
}
startGame();