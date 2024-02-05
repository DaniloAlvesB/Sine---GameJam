//Variables
info = {
	"name": "NPC 1 - Teste",
	"age": 20,
	"speech": {
		"interact": true,
		"act_speech": 0,
		"max_speech": 0,
		"loop": {
			"state": false,
			"speech": 0
		}
	}
}

texts = [
	"Oi Matheus. Tudo bem?",
	"Fiquei sabendo que aconteceu um acidente na sua casa? É verdade isso?"
]
info.speech.max_speech = array_length(texts)

sprite_index = spr_player_idle
image_blend = c_red