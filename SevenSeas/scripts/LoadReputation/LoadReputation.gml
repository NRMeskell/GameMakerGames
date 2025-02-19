// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadReputation(argument0){
	
	ini_open(argument0 + "\\reputation.ini")
	var total = ini_read_real("reputation", "entries", 0)	
		
	for(var i=0; i<total; i++){
		var rep0 = ini_read_string("rep" + string(i), "type", "unknown")
		var rep1 = ini_read_real("rep" + string(i), "amount", 0)
		var rep2 = ini_read_string("rep" + string(i), "des", "unknown")
	
	if rep1 != 0
		ds_list_add(global.reputation, [rep0, rep1, rep2])
	}
	
	ini_close()
}