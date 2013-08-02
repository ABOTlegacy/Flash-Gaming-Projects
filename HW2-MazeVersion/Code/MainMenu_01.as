/* Instantiate Variables */
lnkStart.addEventListener(MouseEvent.CLICK, fl_ClickToGoToNextScene_23);
lnkHowTo.addEventListener(MouseEvent.CLICK, fl_ClickToGoToHowTo);
var starte:Boolean = false;
var howto:Boolean = false;
var mainSong:Sound = new LavenderTown(); 
mainSong.play();


/* Go to game */
function fl_ClickToGoToNextScene_23(event:MouseEvent):void {
	starte = true;
	stop();
	gotoAndPlay(1, "Game");
}

/* Go to how to screen */
function fl_ClickToGoToHowTo(event:MouseEvent):void {
	howto = true;
	stop();
	gotoAndPlay(1, "HowTo");
}
