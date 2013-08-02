this.addEventListener(Event.ENTER_FRAME, frameLoop);
function frameH(){
	if(faderNumber == 43){
		frameNumber = 10;
		gotoAndPlay(0, "MainScreen");
	}else{
		gotoAndPlay(9);
	}
}