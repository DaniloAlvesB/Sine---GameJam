if(place_meeting(x, y - 2, obj_player) and player_enter = false){	
	obj_player.inerce_force += 3
	player_enter = true
	inerce_diff = 3
}else if(!place_meeting(x, y - 2, obj_player) and player_enter){
	if(obj_player.inerce_force - inerce_diff > 0){
		obj_player.inerce_force -= inerce_diff
	}else{
		obj_player.inerce_force = 0
	}
	player_enter = false
	inerce_diff = 0
}