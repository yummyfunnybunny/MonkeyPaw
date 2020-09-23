// ==========================
// ELEMENT SELECTORS
// ==========================
const registerButton = document.querySelector('.btn-register');
const farmButton = document.querySelector('.btn-farm');
// ==========================
// EVENT LISTENERS
// ==========================
registerButton.addEventListener('click', success);
farmButton.addEventListener('click', success);
// ==========================
// FUNCTIONS
// ==========================
function success() {
  // set confetti parameters
  confetti.maxCount = 150;     //set max confetti count
	confetti.speed = 2;          //set the particle animation speed
	confetti.frameInterval = 20; //the confetti animation frame interval in milliseconds
	confetti.alpha = 1;        //the alpha opacity of the confetti (between 0 and 1, where 1 is opaque and 0 is invisible)
  confetti.gradient = false;   //whether to use gradients for the confetti particles
  
  confetti.start(2000);

  var audio = new Audio('birthdaySound.mp3');
  audio.play();
}