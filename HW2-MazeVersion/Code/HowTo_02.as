this.addEventListener(Event.ENTER_FRAME, frameLoop);
function frameA(){
	if(Fader.alpha > 0 && faderNumber == 0){
		Fader.alpha += -.1;
		gotoAndPlay(2);
	}else{
		if(faderNumber == 8){
			frameTimer.stop();
			if(Fader.alpha < 1){
				Fader.alpha += .1;
				gotoAndPlay(2);
			}else{
				frameTimer.stop();
				frameNumber = 3;
				gotoAndPlay(3);
			}
		}else{
			frameTimer.start();
			gotoAndPlay(2);
		}
	}
}