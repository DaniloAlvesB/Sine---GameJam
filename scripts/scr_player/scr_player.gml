#macro GRAVIDADE .5

function move(spd, jump_force, massa){

	var _left = keyboard_check(ord("A"))
	var _right = keyboard_check(ord("D"))
	var _down = keyboard_check_pressed(ord("S"))
	var _jump = keyboard_check(vk_space)
	
	var _horizontal = _right - _left
	
	if(states.hit or states.defaul_atack){
		_horizontal = 0
	}
	
	if(states.slide){
		inerce_force = 0
	}else if(on_ice and _horizontal == 0){
		slide_info.ready = true
		inerce_force = 3.5
	}
	
	//Apply gravity if player is not in the ground
	if(on_gorund == false and vspd < max_vspd){
		vspd += GRAVIDADE * massa
	}else if(on_gorund and !states.jump and !place_meeting(x, y+1, obj_fly)){
		vspd = 0
	}
	
	//Apply inercial move in the player
	if(_horizontal != 0){
		if(inerce_force != 0 and !states.slide){
			hspd = inerce_force * _horizontal
		}
		image_xscale = _horizontal
	}
	
	if(hspd != 0){
		if(hspd > 0){
			hspd -= .1
		}
		if(hspd < 0){
			hspd += .1
		}
		repeat(abs(round(hspd))){
			if(!place_meeting(x + sign(hspd), y, obj_collision)){
				x += sign(hspd)
			}else{
				states.slide = false
				hspd = 0
			}
		}
	}
	
	//Checking collision using speed of the player
	repeat(spd){
		
		if(!states.slide){

			if(!place_meeting(x + _horizontal, y, obj_collision)){
				x += _horizontal
			}
			
		}
		
	}
	
	//Configure slide state
	if(!states.slide and _down and !states.fly and slide_info.ready){
		alarm[0] = slide_info.cd
		slide_info.ready = false
		hspd = _horizontal * 5
		states.slide = true
	}else if(states.slide and _down and slide_info.ready){
		if(hspd < 1 or hspd > -1){
			states.slide = false
		}
	}else if(states.slide and !_down and slide_info.ready){
		if(hspd < 1 or hspd > -1){
			states.slide = false
		}
	}

	//Checking collision using vertical speed of the player
	repeat(abs(vspd)){
		
		if(!place_meeting(x, y + sign(vspd), obj_collision)){
			y += sign(vspd)
		}else if(place_meeting(x, y - 1, obj_collision)){ 
			// If there is a collision at the top of the player, it resets the vertical speed
			vspd = 0
		}
		
	}
	
	//Checking the conditions of jump
	if(_jump && on_gorund){
		vspd = -jump_force
		states.slide = false
		hspd = 0
	}
	
	//Retorno
	if(_horizontal != 0){
		return true
	}else{
		return false
	}

}