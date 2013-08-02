this.addEventListener(Event.ENTER_FRAME, frameLoop);
function frameF(){
	if(faderNumber == 32){
		frameNumber = 8;
		gotoAndPlay(8);
	}else{
		gotoAndPlay(7);
	}
}