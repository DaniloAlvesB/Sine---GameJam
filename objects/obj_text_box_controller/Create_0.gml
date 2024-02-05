//Variables
global.speech = false
texts = ds_map_create()
text_index = 0
word_index = 0
word_position = 0
final_word = ""

text_config = {
	"active": false,
	"speed": 3,
	"padding": 10,
}

var _height = display_get_gui_height()
var _width = display_get_gui_width()
position = {
	"x": text_config.padding,
	"y": _height - 140,
	"sep": 20
}
background = {
	"sprite": spr_bg_textbox,
	"width": 11.70,
	"height": 2
}

states = ["normal", "anger", "sadness", "happiness"]
senders = {
	"player": {
		"name": "Matheus",
		"sprite": noone,
		"state": states[0],
	},
	"NPC_t": {
		"name": "Outro",
		"sprite": noone,
		"state": states[0],
	},
}

//Functions
function add_speech(sender, text, velocity, state){
	
	var _length = ds_map_size(texts)
	ds_map_add(texts, string(_length), {
		"sender": sender,
		"text": text,
		"velocity": velocity,
		"state": state
	})
	
}

function next_text(){
	
	if(ds_map_size(texts) != 0 and text_config.active){

		if !global.speech global.speech = true
	
		var _text = texts[? string(text_index)].text
		if(string_length(final_word) < string_length(_text)){
	
			final_word = _text
	
		}else{
		
			if(text_index + 1 >= ds_map_size(texts)){
				text_config.active = false
			}
			final_word = ""
			word_index = 0
			word_position = 0
			text_index++
		
		}

	}else{

		if global.speech global.speech = false
		
	}
	
	if(ds_map_size(texts) != 0 and !text_config.active){
		ds_map_clear(texts)
		text_index = 0
	}

}

var _text = "Este é um teste, um teste de como irão ficar os textos na tela. Olhe bem: ficam assim. Estes são os textos que teste teste teste teste teste teste teste teste"
//add_speech(senders.NPC_t, _text, 1, states[2])
//add_speech(senders.NPC_t, _text, 1, states[2])
//add_speech(senders.player, _text, 1, states[2])
//add_speech(senders.player, _text, 1, states[2])