stop();


var howTimer:Timer = new Timer(1000);
howTimer.addEventListener(TimerEvent.TIMER, howCall);
var howCounter:Number = 0;


function howCall(event:TimerEvent){
	howCounter++;
	if(howCounter == 1){
		var soundHow:Sound = new HowToSegment();
		soundHow.play();
	}else if(howCounter == 9){
		gotoAndPlay(2);
	}else if(howCounter == 15){
		gotoAndPlay(3);
	}else if(howCounter == 17){
		gotoAndPlay(4);
	}else if(howCounter == 36){
		stop();
		gotoAndPlay(1, "MainMenu");
	}
}






howTimer.start();