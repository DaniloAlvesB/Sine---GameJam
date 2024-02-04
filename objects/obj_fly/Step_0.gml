//Check player distance
if(
	x - obj_player.x > -sprite_width/2 and 
	x - obj_player.x < sprite_width/2 and 
	y - obj_player.y < 300 and
	y - obj_player.y > 0 and
	player_enter = false
){
	obj_player.stats.massa.current -= 0.5
	massa_diff = 0.5
	player_enter = true
}else{
	obj_player.stats.massa.current += massa_diff
	player_enter = false
	massa_diff = 0
}

if(player_enter){
	if(obj_player.vspd > -wind_force and y - obj_player.y < 80){
		obj_player.vspd -= wind_force/3
	}
}

//Check if player fly state is true
if(
	x - obj_player.x > -sprite_width/2 and 
	x - obj_player.x < sprite_width/2 and 
	y - obj_player.y > 0
){
	obj_player.states.fly = true
}else if(!obj_player.on_fly_plataform){
	obj_player.states.fly = false
}