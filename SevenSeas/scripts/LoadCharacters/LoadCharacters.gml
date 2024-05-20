/// @description load characters
function LoadCharacters(argument0) {
	ini_open(argument0 + "-characters.ini")

	instance_destroy(CharacterParent)

	for(i=0; i<ds_list_size(CharacterCreator.characters); i++){
	    character = ds_list_find_value(CharacterCreator.characters, i)
    
	    //read character from save file
	    if bool(ini_read_string(object_get_name(character), "present", false)){
	        instance_create(-50,-50,character)
	        character.myVar = real(ini_read_string(object_get_name(character), "myVar", 0))
	        character.myState = ini_read_string(object_get_name(character), "myState", "unmet")
	    }
	    //add new characters if added post-save file
	    else if bool(ini_read_string(object_get_name(character), "present", true)){
	        if !instance_exists(character)
	            instance_create(-50, -50, character)      
	    }
	}




}
