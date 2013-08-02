/* Instantiate Variables */
lnkStart.addEventListener(MouseEvent.CLICK, fl_ClickToGoToNextScene_23);
var starte:Boolean = false;

/* Go to game */
function fl_ClickToGoToNextScene_23(event:MouseEvent):void{
	starte = true;
	stop();
	gotoAndPlay(1, "Game");
}