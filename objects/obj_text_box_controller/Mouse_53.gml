if(texts != {} and text_config.active){

	var _keys = []
	ds_map_keys_to_array(texts, _keys)
	
	var _text = texts[? _keys[text_index]].text
	if(string_length(final_word) < string_length(_text)){
	
		final_word = _text
	
	}else{
		
		if(text_index + 1 >= ds_map_size(texts)){
			text_config.active = false
		}
		text_index++
		
	}

}

