this.addEventListener(Event.ENTER_FRAME, frameLoop);
function frameE(){
	if(faderNumber == 27){
		frameNumber = 7;
		gotoAndPlay(7);
	}else{
		gotoAndPlay(6);
	}
}