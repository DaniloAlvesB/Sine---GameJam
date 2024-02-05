set_gravity(3)

#region Interact and Speech

	if(distance_to_object(obj_player) < 30 and 
	info.speech.interact and 
	keyboard_check_pressed(ord("E")) and
	!obj_text_box_controller.text_config.active){
		var _length = array_length(texts)
		for(var i = 0; i < _length; i++){
			add_speech_all(info, texts[i], 1, "")	
		}
		if(!info.speech.loop.state){
			info.speech.interact = false
		}
	}
	
	if(obj_text_box_controller.text_config.active){
		alarm[0] = 15
	}

#endregion