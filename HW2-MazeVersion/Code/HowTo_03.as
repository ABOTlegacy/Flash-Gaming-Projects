this.addEventListener(Event.ENTER_FRAME, frameLoop);
function frameB(){
	if(Fader.alpha > 0 && faderNumber == 9){
		Fader.alpha += -.1;
		gotoAndPlay(3);
	}else{
		frameTimer.start();
		if(faderNumber == 15){
			frameNumber = 4;
			gotoAndPlay(4);
		}else{
			gotoAndPlay(3);
		}
	}
}