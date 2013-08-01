stop();

var myChannel:SoundChannel = new SoundChannel();
var BackgroundSounds:Array = new Array(new CrowdCheer(), new Arion(), new LMFAO(), new PickUpLine02());
var k:Number = 0;

/***** Add Event Listeners *****/
this.addEventListener(Event.ENTER_FRAME, stadiumLoop);
function stadiumLoop(event:Event){
	Stadium.width += 15;
	Stadium.height += 10;
}

/***** Count Down Timer *****/
var countDownTimer:Timer = new Timer(1000);
countDownTimer.addEventListener(TimerEvent.TIMER, countDownTimerHandler);
var countDownCounter:Number = 1;
countDownTimer.start();
function countDownTimerHandler(event:TimerEvent):void{
	countDownCounter++;
	if(countDownCounter > 1 && countDownCounter < 3){
		myChannel.stop();
		myChannel = BackgroundSounds[0].play();
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
		myChannel.stop();
		myChannel = BackgroundSounds[1].play();
		countDownThree.visible = false;
		countDownTwo.visible = false;
		countDownOne.visible = false;
		countDownGo.visible = false;
		countDownTimer.stop();
		countDownTimer = null;
		this.removeEventListener(Event.ENTER_FRAME, stadiumLoop);
		gotoAndPlay(2);
	}
}