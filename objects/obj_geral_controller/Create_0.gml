if(instance_number(obj_geral_controller) > 1) instance_destroy()

//Variables
act_room = rm_initial_menu
first_open = true

#region Configurations

	//save
	save_path_name = "localSave.PHS"
	
	//Game pause
	global.gamePaused = false

#endregion

#region Game info

	game_info = {
		"name": "PlataformaHS",
		"version": "0.0.6",
	}

	//Inital config
	if(load_string("game_info", "version", "") != game_info.version){
		
		//Informations
		save_string("game_info", "name", game_info.name)
		save_string("game_info", "version", game_info.version)
		
		//Visual
		save_real("game_info", "resolutionH", 768)
		save_real("game_info", "resolutionV", 432)
		save_real("game_info", "fullScreen", 0)
	}

#endregion

#region Visual
	
	function update_resolution(){
		var _resH = load_real("game_info", "resolutionH", 768)
		var _resV = load_real("game_info", "resolutionV", 432)
		var _fullScreen = load_real("game_indo", "fulLScreen", 0)

		display_set_gui_size(_resH, _resV)
		
		//Resolution		
		view_hport[0] = _resV
		view_wport[0] = _resH
		
		surface_resize(application_surface, _resH, _resV)
		
		camera_set_view_size(view_camera[0], 768, 432);

		
		if(!_fullScreen){
			//Removido pois não será necessário -> alterava o tamanho da janela com a resolução
			//window_set_size(_resH, _resV)	
		}
	
		//Menus
		if(room == rm_initial_menu){
			room_set_height(rm_initial_menu, _resV)
			room_set_width(rm_initial_menu, _resH)
		}
	
		//Screen
		window_set_fullscreen(_fullScreen)
	}
	if(first_open){
		update_resolution()
		first_open = false
	}

#endregion