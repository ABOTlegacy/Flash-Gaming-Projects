stop();


var scene3Timer:Timer = new Timer(1000);
scene3Timer.addEventListener(TimerEvent.TIMER, scene3Call);
var scene3Counter:Number = 0;

var smokeTimer:Timer = new Timer(10);
smokeTimer.addEventListener(TimerEvent.TIMER, smokeCall);
var smokeCounter:Number = 0;

function smokeCall(event:TimerEvent){
	smokeCounter++;
	if(smokeCounter == 1){
		Smoke01.visible = true;
	}else if(smokeCounter == 20){
		Smoke02.visible = true;
	}else if(smokeCounter == 40){
		Smoke03.visible = true;
	}else if(smokeCounter == 80){
		myChannel.stop();
		myChannel = BackgroundSounds[2].play();
		this.removeEventListener(Event.ENTER_FRAME, gameLoop3);
		gotoAndPlay(4);
	}
}


function scene3Call(event:TimerEvent){
	scene3Counter++;
	if(scene3Counter == 1){
		myChannel.stop();
		var sound:Sound = new EndingScene();
		myChannel = sound.play();
	}else if(scene3Counter == 5){
		ProfessorOak.visible = true;
	}else if(scene3Counter == 6){
		RareCandy.visible = true;
	}else if(scene3Counter == 10){
		smokeTimer.start();
	}
}

















/***** Code For The Game Loop *****/
function gameLoop3(event:Event){
	// perform continuous functions\
	scene3Timer.start();
}

/***** Add Event Listners *****/
function startGame3(){
	// Add Event Listeners
	this.addEventListener(Event.ENTER_FRAME, gameLoop3);
}
startGame3();