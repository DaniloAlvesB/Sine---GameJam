function play_music(music, loop){
	
	audio_play_sound(music, 1, loop, global.gain.music/100)
	
}

function play_sonore_effct(effect, loop){
	
	audio_play_sound(effect, 1, loop, global.gain.effects/100)
	
}

function play_speech(epeech, loop){
	
	audio_play_sound(epeech, 1, loop, global.gain.speech/100)
	
}