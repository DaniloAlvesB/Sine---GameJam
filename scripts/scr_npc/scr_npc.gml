function set_gravity(spd){

	repeat(spd){
		if(!place_meeting(x, y + 1, obj_collision)){
			y += 1
		}
	}

}