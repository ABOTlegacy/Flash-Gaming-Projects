import flash.net.drm.VoucherAccessInfo;
import fl.motion.Color;
import fl.transitions.easing.None;
import flash.text.TextField;
import flash.text.TextFieldType;

// Stop The Frame
stop();

// Global Timers Needed Variables
var pokeballTimer:Timer = new Timer(20, 300);
pokeballTimer.addEventListener(TimerEvent.TIMER, pokeballInitialize);
var countDownTimer:Timer = new Timer(1000, 30);
countDownTimer.addEventListener(TimerEvent.TIMER, countDownTimerHandler);
var pokemonTintTimer:Timer = new Timer(20, 600);
pokemonTintTimer.addEventListener(TimerEvent.TIMER, pokemonTint);
var backgroundTimer:Timer = new Timer(100, 6000);
backgroundTimer.addEventListener(TimerEvent.TIMER, backgroundTimerHandler);
var scoreTimerDate:Date = new Date();
var scoreTimer:Timer = new Timer(1000);
scoreTimer.addEventListener(TimerEvent.TIMER, scoreTimerHandler);
var scoreTimeNum:Number = 0;
lblMainMenu.addEventListener(MouseEvent.CLICK, clickGotoMainMenu);

// Global Variables
var pokemon:Array = new Array();
var pokemonWidth:Array = new Array();
var pokemonHeight:Array = new Array();
var pokemonType:Array = new Array();
var pokemonOut:Boolean = false;
var pokemonIndex:Number = -1;
var pokemonTintValue:Number = 100;
var Score:Number = 0;
var pokeballX:Number = 0;
var pokeballY:Number = 0;

// Add drag and drop handlers
var ori_x;
var ori_y;
typeBug.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeBug.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeDark.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeDark.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeFighting.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeFighting.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeFire.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeFire.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeFlying.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeFlying.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeElectric.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeElectric.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeGhost.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeGhost.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeGrass.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeGrass.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeGround.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeGround.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeIce.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeIce.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeNormal.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeNormal.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typePsycic.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typePsycic.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeRock.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeRock.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeSteel.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeSteel.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typeWater.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typeWater.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
typePoison.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
typePoison.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);

/***** Sounds *****/
var backgroundSong:Sound = new ChampLanceRedBattle(); 
var pokeballOpen:Sound = new openPokeball(); 
var pokeballClose:Sound = new closePokeball(); 


/***** Count Down Timer *****/
var countDownCounter:Number = 1;
function countDownTimerHandler(event:TimerEvent):void{
	countDownCounter++;
	if(countDownCounter > 1){
		countDownThree.visible = true;
		countDownTwo.visible = false;
		countDownOne.visible = false;
		countDownGo.visible = false;
	}
	if(countDownCounter > 2){
		countDownThree.visible = false;
		countDownTwo.visible = true;
		countDownOne.visible = false;
		countDownGo.visible = false;
	}
	if(countDownCounter > 3){
		countDownThree.visible = false;
		countDownTwo.visible = false;
		countDownOne.visible = true;
		countDownGo.visible = false;
	}
	if(countDownCounter > 4){
		countDownThree.visible = false;
		countDownTwo.visible = false;
		countDownOne.visible = false;
		countDownGo.visible = true;
	}
	if(countDownCounter > 5){
		countDownThree.visible = false;
		countDownTwo.visible = false;
		countDownOne.visible = false;
		countDownGo.visible = false;
		countDownTimer.stop();
		countDownTimer = null;
		pokeballAppears();
		scoreTimerDate = new Date();
		scoreTimer.start();
		backgroundInit();
		backgroundSong.play();
	}
}

function startGame():void{
	pokemonInit();
	Pokeball.x = -20;
	Pokeball.y = 500;
	countDownTimer.start();
}

/***** Initiate The Pokemon *****/
function pokemonInit():void{
	// Haunter
	pokemon.push(Haunter);
	pokemonWidth.push(315);
	pokemonHeight.push(275);
	pokemonType.push(typeGhost);
	Haunter.visible = false;
	Haunter.width = 0;
	Haunter.height = 0;
	Haunter.x = 650;
	Haunter.y = 500;
	
	// Metapod
	pokemon.push(Metapod);
	pokemonWidth.push(167);
	pokemonHeight.push(190);
	pokemonType.push(typeBug);
	Metapod.visible = false;
	Metapod.width = 0;
	Metapod.height = 0;
	Metapod.x = 650;
	Metapod.y = 500;
	
	// Bellsprout
	pokemon.push(Bellsprout);
	pokemonWidth.push(150);
	pokemonHeight.push(175);
	pokemonType.push(typeGrass);
	Bellsprout.visible = false;
	Bellsprout.width = 0;
	Bellsprout.height = 0;
	Bellsprout.x = 650;
	Bellsprout.y = 500;
	
	// Drowzee
	pokemon.push(Drowzee);
	pokemonWidth.push(315);
	pokemonHeight.push(366);
	pokemonType.push(typePsycic);
	Drowzee.visible = false;
	Drowzee.width = 0;
	Drowzee.height = 0;
	Drowzee.x = 650;
	Drowzee.y = 500;
	
	// Jigglypuff
	pokemon.push(Jigglypuff);
	pokemonWidth.push(200);
	pokemonHeight.push(187);
	pokemonType.push(typeNormal);
	Jigglypuff.visible = false;
	Jigglypuff.width = 0;
	Jigglypuff.height = 0;
	Jigglypuff.x = 650;
	Jigglypuff.y = 500;
	
	// Koffing
	pokemon.push(Koffing);
	pokemonWidth.push(150);
	pokemonHeight.push(150);
	pokemonType.push(typePoison);
	Koffing.visible = false;
	Koffing.width = 0;
	Koffing.height = 0;
	Koffing.x = 650;
	Koffing.y = 500;
	
	// Mankey
	pokemon.push(Mankey);
	pokemonWidth.push(341);
	pokemonHeight.push(239);
	pokemonType.push(typeFighting);
	Mankey.visible = false;
	Mankey.width = 0;
	Mankey.height = 0;
	Mankey.x = 650;
	Mankey.y = 500;
	
	// Psyduck
	pokemon.push(Psyduck);
	pokemonWidth.push(211);
	pokemonHeight.push(275);
	pokemonType.push(typeWater);
	Psyduck.visible = false;
	Psyduck.width = 0;
	Psyduck.height = 0;
	Psyduck.x = 650;
	Psyduck.y = 500;
}


/***** Pokeball Appears *****/
function pokeballAppears():void{
	pokeballTimer.start();
	Pokeball.x = -20;
	Pokeball.y = 500;
	pokemonIndex = 1;
}
function pokeballInitialize(event:TimerEvent):void{
	Pokeball.x += 10;
	Pokeball.rotation += 10;
	if(Pokeball.x > 650){
		pokeballTimer.stop();
		pokeballX = Pokeball.x;
		pokeballY = Pokeball.y;
		pokemonAppears();
	}
}

/***** Pokemon Appears *****/
function pokemonAppears():void{
	pokemonIndex = Math.round(Math.random() * (pokemon.length - 1));
	trace(pokemon.length + " : " + pokemonIndex);
	pokemon[pokemonIndex].visible = true;
	pokemonTintTimer.reset();
	pokemonTintTimer.start();
	pokeballOpen.play();
}
function pokemonTint(event:TimerEvent):void{
	var c:Color = new Color();
	c.setTint(0xFF0000, pokemonTintValue/100);
	if(pokemonOut){
		if(pokemonTintValue == 100){
			pokemonTintTimer.reset();
			pokemonTintTimer.stop();
			pokemonOut = false;
			pokemon[pokemonIndex].visible = false;
			pokemon.splice(pokemonIndex, 1);
			pokemonWidth.splice(pokemonIndex, 1);
			pokemonHeight.splice(pokemonIndex, 1);
			pokemonType.splice(pokemonIndex, 1);
			if(pokemon.length > 0){
				pokemonAppears();
			}else{
				gameEnd();
			}
		}else{
			pokemon[pokemonIndex].transform.colorTransform = c;
			pokemon[pokemonIndex].width = pokemon[pokemonIndex].width - (pokemonWidth[pokemonIndex] / 100);
			pokemon[pokemonIndex].height = pokemon[pokemonIndex].height - (pokemonHeight[pokemonIndex] / 100);
			pokemon[pokemonIndex].x = pokemon[pokemonIndex].x + (pokemonWidth[pokemonIndex] / 100) + 1;
			pokemon[pokemonIndex].y = pokemon[pokemonIndex].y + (pokemonHeight[pokemonIndex] / 100) + .2;
			pokemonTintValue++;
		}
	}else{
		if(pokemonTintValue == 0){
			pokemonTintTimer.stop();
			pokemonOut = true;
		}else{
			pokemon[pokemonIndex].transform.colorTransform = c;
			pokemon[pokemonIndex].width = pokemon[pokemonIndex].width + (pokemonWidth[pokemonIndex] / 100);
			pokemon[pokemonIndex].height = pokemon[pokemonIndex].height + (pokemonHeight[pokemonIndex] / 100);
			pokemon[pokemonIndex].x = pokemon[pokemonIndex].x - (pokemonWidth[pokemonIndex] / 100) - 1;
			pokemon[pokemonIndex].y = pokemon[pokemonIndex].y - (pokemonHeight[pokemonIndex] / 100) - .2;
			pokemonTintValue--;
		}
	}
}

/***** Checks the answer *****/
function checkAnswer(target, obj):void{
	if(target.parent == pokedex){
		if(obj == pokemonType[pokemonIndex]){
			pokeballClose.play();
			pokemonTintTimer.start();
		}
	}
	obj.x = ori_x;
	obj.y = ori_y;
}

/***** Drag and Drop Handlers *****/
function mouseDownHandler(evt:MouseEvent):void {
	var object = evt.target;
	ori_x = object.x;
	ori_y = object.y;
	object.useHandCursor = true;
	object.startDrag();
}
function mouseUpHandler(evt:MouseEvent):void {
	var obj = evt.target;
	var target = obj.dropTarget;
	if (target != null) {
		checkAnswer(target, obj);
	}
	obj.stopDrag();
}


/***** Background Timer *****/
var xState:Number = 0;
var yState:Number = 0;
var xMove:Number = 0;
var yMove:Number = 0;
var xOrigin:Number = -450;
var yOrigin:Number = -60;
var backgroundIntervalA:Number = 0;
var backgroundIntervalB:Number = 0;
var backgroundIntervalACount:Number = 0;
var backgroundIntervalBCount:Number = 0;
var i:Number = 0;
function backgroundInit():void{
	if(yState == 0 && xState == 0){
		xState = (Math.round(Math.random() * 2)) - 1;
		yState = (Math.round(Math.random() * 2)) - 1;
		xMove = Math.round(Math.random() * 150);
		yMove = Math.round(Math.random() * 50);
	}
	backgroundIntervalA = Math.round(Math.random() * 100);
	backgroundIntervalB = Math.round(Math.random() * 100);
	backgroundIntervalACount = backgroundIntervalA;
	backgroundIntervalBCount = backgroundIntervalB;
	backgroundTimer.start();
}
function backgroundTimerHandler(event:TimerEvent):void{
	if(backgroundIntervalA == 0 && backgroundIntervalB == 0){
		xState = 0;
		yState = 0;
		xMove = 0;
		yMove = 0;
		backgroundTimer.reset();
		backgroundTimer.stop();
		backgroundInit();
	}else{
		if(backgroundIntervalA > 0 && backgroundIntervalB > 0){
			Background.x = Background.x + ((xMove / backgroundIntervalACount) * xState);
			Background.y = Background.y + ((yMove / backgroundIntervalACount) * yState);
			for(i = 0; i < pokemon.length; i++){
				pokemon[i].x = pokemon[i].x + ((xMove / backgroundIntervalACount) * xState);
				pokemon[i].y = pokemon[i].y + ((yMove / backgroundIntervalACount) * yState);
			}
			Pokeball.x = Pokeball.x + ((xMove / backgroundIntervalACount) * xState);
			Pokeball.y = Pokeball.y + ((yMove / backgroundIntervalACount) * yState);
			backgroundIntervalA--;
		}else{
			Background.x = Background.x - ((xMove / backgroundIntervalBCount) * xState);
			Background.y = Background.y - ((yMove / backgroundIntervalBCount) * yState);
			for(i = 0; i < pokemon.length; i++){
				pokemon[i].x = pokemon[i].x - ((xMove / backgroundIntervalBCount) * xState);
				pokemon[i].y = pokemon[i].y - ((yMove / backgroundIntervalBCount) * yState);
			}
			Pokeball.x = Pokeball.x - ((xMove / backgroundIntervalBCount) * xState);
			Pokeball.y = Pokeball.y - ((yMove / backgroundIntervalBCount) * yState);
			backgroundIntervalB--;
		}
		i = 0;
		//trace("Pokemon (" + pokemon[pokemonIndex].x + "," + pokemon[pokemonIndex].y + ")");
		//trace("Pokeball (" + (Pokeball.x - pokeballX) + "," + (Pokeball.y - pokeballY) + ")");
		//trace("Background (" + (Background.x - xOrigin) + "," + (Background.y - yOrigin) + ")");
	}
}

/* Score Timer counter */
function scoreTimerHandler(event:TimerEvent):void{
	//scoreTimeNum = scoreTimeNum + 1000;
	//var now:Date = new Date();
	//var timeLeft:Number = now.getTime() - scoreTimerDate.getTime();
	//trace("TIME: " + Math.floor((timeLeft/1000)));
	//var seconds:Number = Math.floor(timeLeft / 1000);
	//var minutes:Number = Math.floor(seconds / 60);
	//var strMin:String = "";
	//var strSec:Number = 0;
	//var str:String = "";
	//if(minutes < 10){
		//strMin = "0";
	//}
	//strMin = strMin + (minutes%60).toString();
	//lblTimerMin.text = strMin;
	//strSec = (Math.floor((scoreTimeNum/1000))%60);
	//str = strSec.toString();
	//trace(str);
	//if(seconds < 10){
		//strSec = strSec;
	//}
	//lblTimerSec.text = String("3");
}


/* Moves the game to the end game screen */
function gameEnd():void{
	lblMainMenu.visible = true;
	professorOak.visible = true;
	lblGreatJob.visible = true;
	endingBox.visible = true;
}

/* Go to how to screen */
function clickGotoMainMenu(event:MouseEvent):void {
	gotoAndPlay(0, "HomeScreen");
}


// Start
startGame();