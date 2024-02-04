if(!global.gamePaused and room != rm_initial_menu){
	
	if(clocks_count%(seccond_time/clock_time) == 0 and clocks_count != 0){
		total_seconds++
	
		if(total_seconds >= 60){
			total_minutes++
			total_seconds = 0
		}
	
		if(total_minutes >= 60){
			total_hours++
			total_minutes = 0
		}
	
		if(total_hours >= 24){
			total_hours = 0
			total_minutes = 0
			total_seconds = 0
			clocks_count = 0
		}
	}

	clocks_count++
	
}

//Clock
alarm[0] = clock_time