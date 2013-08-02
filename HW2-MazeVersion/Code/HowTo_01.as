var frameTimer:Timer = new Timer(1000);
frameTimer.addEventListener(TimerEvent.TIMER, frameNext);
this.addEventListener(Event.ENTER_FRAME, frameLoop);
var faderNumber:Number = 0;
var frameNumber:Number = 2;
var frame01:Boolean = false;
frameTimer.stop();
var backgroundSong:Sound = new PokeMazeHowTo(); 
backgroundSong.play();
function frameLoop(event:Event){
	if(frameNumber == 2){
		frameA();
	}
	if(frameNumber == 3){
		frameB();
	}
	if(frameNumber == 4){
		frameC();
	}
	if(frameNumber == 5){
		frameD();
	}
	if(frameNumber == 6){
		frameE();
	}
	if(frameNumber == 7){
		frameF();
	}
	if(frameNumber == 8){
		frameG();
	}
	if(frameNumber == 9){
		frameH();
	}
}
function frameNext(event:TimerEvent){
	faderNumber++;
	trace("BATMAN: " + faderNumber);
}