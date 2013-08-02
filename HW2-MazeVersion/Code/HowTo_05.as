this.addEventListener(Event.ENTER_FRAME, frameLoop);
function frameD(){
	if(faderNumber == 23){
		frameNumber = 6;
		gotoAndPlay(6);
	}else{
		gotoAndPlay(5);
	}
}