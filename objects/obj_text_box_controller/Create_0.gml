//Variables
texts = ds_map_create()
text_index = 0
word_index = 0
word_position = 0
final_word = ""

text_config = {
	"active": true,
	"speed": 3,
	"padding": 10,
}

states = ["normal", "anger", "sadness", "happiness"]
senders = {
	"player": {
		"name": "Matheus",
		"sprite": noone,
		"state": states[0],
	},
	"other": {
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

var _text = "Este é um teste, um teste de como irão ficar os textos na tela. Olhe bem: ficam assim. Estes são os textos que teste teste teste teste teste teste teste teste"
add_speech(senders.player, _text, 1, states[2])