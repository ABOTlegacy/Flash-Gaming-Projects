if(howto){
	trace("B");
	gotoAndPlay(0, "HowTo");
}else{
	if(starte){
		trace("A");
		gotoAndPlay(0, "Game");
	}else{
		gotoAndPlay(1);
	}
}