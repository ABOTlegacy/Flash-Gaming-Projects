stop();

var nScore:Number = 0;

for(var i:Number = 0; i < aCorrectAnswers.length; i++){
	this["userAnswer" + i + "_txt"].text = aUserAnswers[i];
	if(aUserAnswers[i].toUpperCase() == aCorrectAnswers[i].toUpperCase()){
		nScore++;
	}
}
score_txt.text = nScore.toString();


lnkMainMenu.addEventListener(MouseEvent.CLICK, GoMainMenu);

/* Go to game */
function GoMainMenu(event:MouseEvent):void{
	stop();
	gotoAndPlay(1, "MainMenu");
}