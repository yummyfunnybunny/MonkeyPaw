// ==========================
// ELEMENT SELECTORS
// ==========================
const registerButton = document.querySelector('.btn-register');
const farmButton = document.querySelector('.btn-farm');
const oracleButton = document.querySelector('.btn-oracle');
// ==========================
// EVENT LISTENERS
// ==========================
farmButton.addEventListener('click', success);
//oracleButton.addEventListener('click', success);

registerButton.addEventListener('click', function() {
  var repo = document.querySelector('.reg-name-input').value;
  var owner = document.querySelector('.reg-author-input').value;
  var pr = document.querySelector('.reg-pr-input').value;
  deposit(owner, repo, pr);
});
// ==========================
// FUNCTIONS
// ==========================


// Testing out something
function success() {
  // set confetti parameters
  confetti.maxCount = 150;     //set max confetti count
	confetti.speed = 10;          //set the particle animation speed
	confetti.frameInterval = 20; //the confetti animation frame interval in milliseconds
	confetti.alpha = 1;        //the alpha opacity of the confetti (between 0 and 1, where 1 is opaque and 0 is invisible)
  confetti.gradient = false;   //whether to use gradients for the confetti particles

  confetti.start(2000);

  var audio = new Audio('birthdaySound.mp3');
  audio.play();
}
