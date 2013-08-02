stop();

/***** Count Down Timer *****/
var countDownTimer:Timer = new Timer(1000, 30);
countDownTimer.addEventListener(TimerEvent.TIMER, countDownTimerHandler);
var countDownCounter:Number = 1;
countDownTimer.start();
function countDownTimerHandler(event:TimerEvent):void{
	countDownCounter++;
	if(countDownCounter > 1){
		countDownThree.visible = true;
		countDownTwo.visible = false;
		countDownOne.visible = false;
		countDownGo.visible = false;
	}
	if(countDownCounter > 2){
		countDownThree.visible = false;
		countDownTwo.visible = true;
		countDownOne.visible = false;
		countDownGo.visible = false;
	}
	if(countDownCounter > 3){
		countDownThree.visible = false;
		countDownTwo.visible = false;
		countDownOne.visible = true;
		countDownGo.visible = false;
	}
	if(countDownCounter > 4){
		countDownThree.visible = false;
		countDownTwo.visible = false;
		countDownOne.visible = false;
		countDownGo.visible = true;
	}
	if(countDownCounter > 5){
		countDownThree.visible = false;
		countDownTwo.visible = false;
		countDownOne.visible = false;
		countDownGo.visible = false;
		countDownTimer.stop();
		countDownTimer = null;
		gotoAndPlay(2);
	}
}