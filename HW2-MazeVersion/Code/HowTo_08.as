this.addEventListener(Event.ENTER_FRAME, frameLoop);
function frameG(){
	if(faderNumber == 36){
		frameNumber = 9;
		gotoAndPlay(9);
	}else{
		gotoAndPlay(8);
	}
}