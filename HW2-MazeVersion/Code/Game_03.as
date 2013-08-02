stop();
/* Instantiate Variables */
lnkMain.addEventListener(MouseEvent.CLICK, ClickToGoToMain);

/* Go to main */
function ClickToGoToMain(event:MouseEvent):void {
	gotoAndPlay(0, "MainScreen");
}