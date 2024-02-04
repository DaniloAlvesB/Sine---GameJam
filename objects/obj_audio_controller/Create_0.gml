if(instance_number(obj_audio_controller) > 1) instance_destroy()

//Vartiables
var _sub = 90
global.gain = {
	"music": 100 - _sub,
	"effects": 100 - _sub,
	"speech": 100 - _sub,
	"geral": 100 - _sub,
}