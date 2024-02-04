//variables
stats = {
	"jump_force": {
		"base": 10,
		"current": 10
	},
	"massa": {
		"base": 1,
		"current": 1
	},
	"spd": {
		"base": 2,
		"current": 2
	},
}

states = {
	"walk": true,
	"jump": false,
	"fly": false,
	"slide": false,
	"hit": false,
	"defaul_atack": false,
}

max_vspd = 15
on_gorund = false
on_ice = false
vspd = 0 // The vertial velocity for gravity and jump
hspd = 0 // The horizontal speed used for inercial move after the player stop the walk
inerce_force = 1 // The inercial force aply in the player after stop walk

//Animation
jump_animation_settings = {
	"count": 0,
	"act_img": 0,
	"down": 0,
}

hit_animation_settings = {
	"hit": false,
	"cd": 20
}

base_atk_animation_settings = {
	"atack": false,
	"count": 0,
	"act_img": 0,
	"keys": [0, 6, 14, 21, 24],
	"key_count": 5,
	"act_key": 0,
	"cd": 5
}

//Habilities
slide_info = {
	"ready": true,
	"cd": 60
}