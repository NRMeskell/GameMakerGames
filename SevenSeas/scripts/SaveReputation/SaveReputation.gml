// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveReputation(argument0){
	
	if file_exists(argument0 + "-reputation.ini")
		file_delete(argument0 + "-reputation.ini")
	
	ini_open(argument0 + "-reputation.ini")	
	ini_write_real("reputation", "entries", ds_list_size(global.reputation))
	
	for(var i=0; i<ds_list_size(global.reputation); i++){
		ini_write_string("rep" + string(i), "type", ds_list_find_value(global.reputation, i)[0])
		ini_write_real("rep" + string(i), "amount", ds_list_find_value(global.reputation, i)[1])
		ini_write_string("rep" + string(i), "des", ds_list_find_value(global.reputation, i)[2])
	}
	
	ini_close()
}