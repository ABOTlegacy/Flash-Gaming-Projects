this.addEventListener(Event.ENTER_FRAME, frameLoop);
function frameC(){
	if(faderNumber == 17){
		frameNumber = 5;
		gotoAndPlay(5);
	}else{
		gotoAndPlay(4);
	}
}