draw_set_font(fn_text)
var _width = display_get_gui_width()
var _height = display_get_gui_height()
var mouse = {
	"x": device_mouse_x_to_gui(0),
	"y": device_mouse_y_to_gui(0),
}


//Draw textbox
if(ds_map_size(texts) > 0 and text_config.active){

	//Background
	draw_sprite_ext(background.sprite, 0, position.x, position.y, background.width, background.height, 0, c_white, 1)
	
	//Name
	draw_set_font(fn_name)
	draw_text(position.x, position.y - 30, texts[? string(text_index)].sender.name)
	
	//text
	var _text = texts[?  string(text_index)].text
	if(string_length(final_word) < string_length(_text)){
		word_index++
		if(word_index >= text_config.speed){
			word_index = 0
		
			final_word = string_copy(_text, 0, word_position)
		
			word_position++
		}
	}
	
	draw_set_font(fn_text)
	draw_text_ext(position.x + text_config.padding, position.y + text_config.padding, final_word, position.sep, _width - (text_config.padding*2))
	
}


//Debug
if(texts != {}){

	var _length = ds_map_size(texts)
	draw_set_font(fn_text)
	
	for(var i = 0; i < _length; i++){
		draw_text_ext(10, 10 + (30*i), texts[? string(i)].text, 10, 1000)
	}

}