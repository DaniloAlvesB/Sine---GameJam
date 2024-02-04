#region Gerais

	function open_ini(){

		var file_name = obj_geral_controller.save_path_name
		ini_open(file_name)

	}
	
	function encode(value){

		var _base_str = base64_encode(string(value))
	
		return base64_encode(_base_str)

	}

	function decode(value){

		var _base_str = base64_decode(string(value))
	
		return base64_decode(_base_str)

	}

#endregion

#region String

	function save_string(section, key, str){

		open_ini()
	
		ini_write_string(section, key, str)
	
		ini_close()

	}

	function save_string_encoded(section, key, str){

		open_ini()
	
		ini_write_string(section, key, encode(str))
	
		ini_close()

	}
		
	function load_string(section, key, default_value){
		
		open_ini()
		
		return ini_read_string(section, key, default_value)
		
		ini_close()
		
	}
		
	function load_string_decoded(section, key, default_value){
		
		open_ini()
		
		return decode(ini_read_string(section, key, default_value))
		
		ini_close()
		
	}

#endregion

#region Real

	function save_real(section, key, value){

		open_ini()
	
		ini_write_real(section, key, value)
	
		ini_close()

	}

	function save_real_encoded(section, key, value){

		open_ini()
	
		ini_write_string(section, key, encode(value))
	
		ini_close()

	}
		
	function load_real(section, key, default_value){
		
		open_ini()
		
		return real(ini_read_string(section, key, string(default_value)))
		
		ini_close()
		
	}
		
	function load_real_decoded(section, key, default_value){
		
		open_ini()
		
		return real(decode(ini_read_string(section, key, string(default_value))))
		
		ini_close()
		
	}

#endregion