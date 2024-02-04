var _width = display_get_gui_width()
var _height = display_get_gui_height()
var mouse = {
	"x": device_mouse_x_to_gui(0),
	"y": device_mouse_y_to_gui(0),
}

//Draw text
if(texts != {} and text_config.active){
	
	var _keys = []
	ds_map_keys_to_array(texts, _keys)
	
	//Name
	draw_text(10, _height - 150, texts[? _keys[text_index]].sender.name)
	
	//text
	var _text = texts[? _keys[text_index]].text
	if(string_length(final_word) < string_length(_text)){
		word_index++
		if(word_index >= text_config.speed){
			word_index = 0
		
			final_word = string_copy(_text, 0, word_position)
		
			word_position++
		}
	}
	
	draw_text_ext(text_config.padding, _height - 120, final_word, 30, _width-text_config.padding)
	
}