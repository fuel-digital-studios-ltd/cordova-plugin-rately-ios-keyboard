// cordova.define("cordova-plugin-customkeyboard.CustomKeyboard", function(require, exports, module) {
cordova.define("ru.appsm.customkeyboard.customkeyboard", function(require, exports, module) {
    
var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');
   
var CustomKeyboard = function() {
};

//keyboard pattern;
// 1 =  UIKeyboardTypeDefault;              
// 2 =  UIKeyboardTypeASCIICapable;       
// 3 = UIKeyboardTypeNumbersAndPunctuation;
// 4 =  UIKeyboardTypeURL;                 
// 5 =  UIKeyboardTypeNumberPad;      
// 6 =  UIKeyboardTypePhonePad;  
// 7 =  UIKeyboardTypeNamePhonePad;
// 8 =  UIKeyboardTypeEmailAddress; 
// 9 =  UIKeyboardTypeDecimalPad;
// 10 =  UIKeyboardTypeTwitter;
// 11 =  UIKeyboardTypeWebSearch;

CustomKeyboard.open = function(value, keyboard, onChange, onFinished) {
    !keyboard && (keyboard = 1);
    !value && (value = '');
    value = '' + value;
    exec(onChange, onFinished, "CustomKeyboard", "open", [value, keyboard]);
};

CustomKeyboard.prepare = function(value, keyboard, onChange, onFinished) {
    !keyboard && (keyboard = 1);
    !value && (value = '');
    value = '' + value;
    exec(onChange, onFinished, "CustomKeyboard", "prepare", [value, keyboard]);
};

CustomKeyboard.finished = function() {
	return exec(null, null, "CustomKeyboard", "close", null);
};

CustomKeyboard.setScreenOrientation = function(screenOrientationValue) {
	return exec(null, null, "CustomKeyboard", "setScreenOrientation", [screenOrientationValue]);
};

CustomKeyboard.hideTextBox = function(value, keyboard, onChange, onFinished) {
	exec(null, null, "CustomKeyboard", "hideTextBox", null);
};

CustomKeyboard.revealTextBox = function(value, keyboard, onChange, onFinished) {
	exec(null, null, "CustomKeyboard", "revealTextBox", null);
};

module.exports = CustomKeyboard;

});