draw_self()

#region Interact and Speech

	if(distance_to_object(obj_player) < 30){
	
		draw_set_halign(fa_center)
		draw_set_font(fn_text)
		
		draw_text(x, y-40, "E")
		
		draw_set_halign(fa_left)
	
	}

#endregion