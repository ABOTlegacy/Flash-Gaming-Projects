stop();

var j:Number = 0;
var lights:Array = new Array(Light00, Light01, Light02, Light03, Light04, Light05, Light06, Light07, Light08, Light09);



function lighting(){
	var choosen:Number = Math.round(Math.random() * 19);
	if(choosen < 10){
		lights[choosen].visible = ! lights[choosen].visible;
	}
}


/* Go to game */
function GoMainMenu(event:MouseEvent):void{
	stop();
	gotoAndPlay(1, "MainMenu");
}

/***** Code For The Game Loop *****/
function gameLoop4(event:Event){
	// perform continuous functions
	lighting();
}

/***** Add Event Listners *****/
function startGame4(){
	// Add Event Listeners
	this.addEventListener(Event.ENTER_FRAME, gameLoop4);
	lnkMainMenu.addEventListener(MouseEvent.CLICK, GoMainMenu);
	
	for(j = 0; j < lights.length; j++){
		lights[j].alpha = .5;
	}
}
startGame4();