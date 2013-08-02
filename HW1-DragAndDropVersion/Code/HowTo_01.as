stop();
lblMainMenu2.addEventListener(MouseEvent.CLICK, gotoMain);

function gotoMain(event:MouseEvent):void {
	gotoAndPlay(0, "Game");
}