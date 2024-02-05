function add_speech_all(sender, text, velocity, state){
	
	var _length = ds_map_size(obj_text_box_controller.texts)
	ds_map_add(obj_text_box_controller.texts, string(_length), {
		"sender": sender,
		"text": text,
		"velocity": velocity,
		"state": state
	})
	obj_text_box_controller.text_config.active = true
	
}
