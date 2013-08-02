stop();

/***** Imports *****/
import flash.events.MouseEvent;
import fl.motion.Color;
import flash.display.MovieClip;
import flash.display.DisplayObject;
import flash.display.Graphics;


/***** Instantiate Variables *****/
var nQNumber:Number = 0;
var aPokemonSounds:Array = new Array(new ItsKoffing(), new ItsSandshrew(), new ItsDrowzee(), new ItsPsyduck(), new ItsMankey(), new ItsHaunter(), new ItsJigglypuff(), new ItsBellsprout(), new ItsMetapod());
var aPokemon:Array = new Array(Koffing, Sandshrew, Drowzee, Psyduck, Mankey, Haunter, Jigglypuff, Bellsprout, Metapod);
var aPokemonAnswers:Array = new Array(KoffingAnswer, SandshrewAnswer, DrowzeeAnswer, PsyduckAnswer, MankeyAnswer, HaunterAnswer, JigglypuffAnswer, BellsproutAnswer, MetapodAnswer);
var aCorrectAnswers:Array = new Array("Koffing", "Sandshrew", "Drowzee", "Psyduck", "Mankey", "Haunter", "Jigglypuff", "Bellsprout", "Metapod");
var aUserAnswers:Array = new Array();
var whosThatPokemon:Sound = new WhosThatPokemon(); 


/***** Instantiate I/Os *****/
submit_btn.addEventListener(MouseEvent.CLICK, submitClick);
continue_btn.addEventListener(MouseEvent.CLICK, continueClick);


/***** Click Functions *****/
function submitClick(evt:MouseEvent):void{
	// Store Answers
	aUserAnswers.push(answers_txt.text);
	
	// Reveal Answer
	showAnswer();
}
function continueClick(evt:MouseEvent):void{
	// Hide Previous Answers
	aPokemon[nQNumber].visible = false;
	aPokemonAnswers[nQNumber].visible = false;
	
	// Go to next question
	nQNumber++;
	if (nQNumber < aCorrectAnswers.length){
		showQuestion();
	}else{
		gotoAndPlay(2);
	}
}


/***** Show Content *****/
function showQuestion(){
	// Set Question Elements Visible
	submit_btn.visible = true;
	answers_txt.visible = true;
	QuestionMark.visible = true;
	aPokemon[nQNumber].visible = true;
	
	// Set Answer Elements Invisible
	continue_btn.visible = false;
	
	// Reset Elements
	answers_txt.text = "";
	var c:Color = new Color();
	c.setTint(0x000000, 1);
	aPokemon[nQNumber].getChildAt(i).transform.colorTransform = c;
	
	// Play Sound
	whosThatPokemon.play();
}

function showAnswer(){
	// Set Question Elements Visible
	submit_btn.visible = false;
	answers_txt.visible = false;
	QuestionMark.visible = false;
	
	// Set Answer Elements Invisible
	continue_btn.visible = true;
	
	// Show Answers
	var c:Color = new Color();
	c.setTint(0x000000, 0);
	aPokemon[nQNumber].getChildAt(i).transform.colorTransform = c;
	aPokemonAnswers[nQNumber].visible = true;
	
	// Play Sound
	var itsPokemon:Sound = aPokemonSounds[nQNumber]; 
	itsPokemon.play();
}



/***** Code For The Game Loop *****/
function gameLoop(event:Event){
	// perform continuous functions
	showQuestion();
}



/***** Add Event Listners *****/
function startGame(){
	// Add Event Listeners
	this.addEventListener(Event.ENTER_FRAME, gameLoop);
}

showQuestion();