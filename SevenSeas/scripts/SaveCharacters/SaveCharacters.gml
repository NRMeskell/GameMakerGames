/// @description Save Characters
function SaveCharacters(argument0) {

	ini_open(argument0 + "\\characters.ini")

	for(i=0; i<ds_list_size(CharacterCreator.characters); i++){
	    character = ds_list_find_value(CharacterCreator.characters, i)
	    if instance_exists(character){
	        ini_write_string(object_get_name(character), "present", true)
	        ini_write_string(object_get_name(character), "myVar", character.myVar)
	        ini_write_string(object_get_name(character), "myState", character.myState)
	        }
	    else{
	        ini_write_string(object_get_name(character), "present", false)
	        ini_write_string(object_get_name(character), "myVar", 0)
	        ini_write_string(object_get_name(character), "myState", "unmet")
	        }
	    }
    
	ini_close()
}
