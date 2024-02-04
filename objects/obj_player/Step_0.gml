if global.gamePaused exit

//Move and gravity
var _runing = false
if(states.walk == true){
	_runing = move(stats.spd.current, stats.jump_force.current, stats.massa.current);
}

//Check if player is in the ground
on_gorund = place_meeting(x, y + 1, obj_collision)

#region Jumping
	
	//Switching the player jump state
	if(states.jump == true && on_gorund == true){
		states.jump = false
	}
	
#endregion

#region FlyPlataform and IcePlataform

	for(var i = 0; i < 300; i++){
		if(place_meeting(x, y + i, obj_fly)){
			on_fly_plataform = true
			break
		}else{
			on_fly_plataform = false
		}
	}
	
	for(var i = 0; i < 300; i++){
		if(place_meeting(x, y + i, obj_ice)){
			on_ice = true
			break
		}else{
			on_ice = false
		}
	}

#endregion

#region Animations

	var _geral_img_speed = stats.spd.current * .75 / stats.spd.base
	
	if(!states.jump and !states.hit){
		
		if(_runing){
			image_speed = _geral_img_speed
			sprite_index = spr_player_run
		}else if(!_runing){
			if(hspd <= 1 and hspd >= -1){
				states.slide = false
				image_speed = 1
				sprite_index = spr_player_idle
			}else{
				states.slide = true
			}
		}
		
	}
	
	if(!states.hit){
		
		if(vspd != 0 and !states.fly){
		
			sprite_index = spr_player_jump	
			image_speed = 0
		
			var _jump_frame_timer = 3
			if(vspd < 0){
				
				//Sound
				if(jump_animation_settings.count == 1 and jump_animation_settings.down){
					//Jump sound
				}
			
				jump_animation_settings.count++
				if(jump_animation_settings.count%_jump_frame_timer == 0 and jump_animation_settings.act_img < 10){
					jump_animation_settings.act_img++ 	
				}
				jump_animation_settings.down = true
			
			}else if(vspd > 0){
			
				if(vspd < 1 and jump_animation_settings.down){
					jump_animation_settings.act_img = 10
					jump_animation_settings.down = false
				}
			
				jump_animation_settings.count++
			
				if(jump_animation_settings.count%_jump_frame_timer == 0 and jump_animation_settings.act_img < 15){
					jump_animation_settings.act_img++ 	
				}
			
			}
		
			image_index = jump_animation_settings.act_img

		}else{
			jump_animation_settings.count = 0
			jump_animation_settings.act_img = 0
		}
	
		if(on_gorund){
			jump_animation_settings = {
				"count": 0,
				"act_img": 0,
				"down": 0,
			}
		}
	
		if(states.fly){
			image_speed = 1
			sprite_index = spr_player_fly
		}
	
		if(states.slide){
		sprite_index = spr_player_slide
	}
			
		if(states.defaul_atack){
			
			sprite_index = spr_player_default_atack
			image_speed = 0
			
			base_atk_animation_settings.atack = true
			alarm[2] = base_atk_animation_settings.cd
		
			var _atack = mouse_check_button_pressed(mb_left)
			
			base_atk_animation_settings.count++
			if(base_atk_animation_settings.count%4 == 0){
				base_atk_animation_settings.act_img++
				if(!place_meeting(x + image_xscale, y, obj_collision)){
					x += image_xscale
				}				
			}
			
			//Continue atack
			var _act_key = base_atk_animation_settings.act_key
			var _keys = base_atk_animation_settings.keys
			var _act_img = base_atk_animation_settings.act_img
			if(_atack){
				if(_act_key < base_atk_animation_settings.key_count){
					if(_act_img > _keys[_act_key] - 1 or _act_img < _keys[_act_key] + 1){
						if(base_atk_animation_settings.act_key <= base_atk_animation_settings.key_count){
							base_atk_animation_settings.act_key++
							if(vspd > -3){
								vspd -= 3
							}
							
							//Sound
							//if(!audio_is_playing(snd_grunt_1) and !audio_is_playing(snd_grunt_2)){
								//atack audio
							//}
						}
					}
				}
			}else{
				if(_act_key < base_atk_animation_settings.key_count){
					if(_act_img >= _keys[_act_key]){
						states.defaul_atack = false
						base_atk_animation_settings.count = 0
						base_atk_animation_settings.act_img = 0
						base_atk_animation_settings.act_key = 0
					}
				}else if(_act_img >= sprite_get_number(sprite_index)){
					states.defaul_atack = false
					base_atk_animation_settings.count = 0
					base_atk_animation_settings.act_img = 0
					base_atk_animation_settings.act_key = 0
				}
			}
			
			if(_act_img < sprite_get_number(sprite_index)){
				image_index = base_atk_animation_settings.act_img
			}
			
			for(var i = 1; i < base_atk_animation_settings.key_count-1; i++){
				if(_act_img + 3 =  _keys[i] and instance_number(obj_player_default_atack_collision) == 0){		
					//Colisão
					var _col = instance_create_depth(x, y, depth, obj_player_default_atack_collision)
					_col.image_xscale = image_xscale
				}
			}
			
		}
		
	}else{
		
		if(states.hit and !hit_animation_settings.hit){
			image_speed = 1
			sprite_index = spr_player_hit
			alarm[1] = hit_animation_settings.cd
			hit_animation_settings.hit = true
		}
			
	}

#endregion

#region Sounds

	/*
	if(_runing and on_gorund and !states.slide){
		if(audio_is_paused(snd_run_stone)){
			audio_resume_sound(snd_run_stone)
		}else if(!audio_is_playing(snd_run_stone)){
			play_sonore_effct(snd_run_stone, 1)
		}
	}else if(!_runing or !on_gorund or states.slide){
		audio_pause_sound(snd_run_stone)
	}
	
	//The ATACK soun is in the atack colision and in the global click and in the animation controll
	//The JUMP sound is in the animation code
	*/
#endregion

#region Debug

	if(mouse_wheel_up()){
		stats.spd.current++
	}
	
	if(mouse_wheel_down()){
		stats.spd.current--
	}

#endregion