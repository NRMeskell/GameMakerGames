function LoadPirates(argument0) {
	repeat(instance_number(Pirate)){
	    var oldPirate = instance_find(Pirate, 0)
	    oldPirate.mySlot.occupied = false
	    ds_list_delete(global.crewList, ds_list_find_index(global.crewList, oldPirate.id))
	    global.crewSize --
	    instance_destroy(oldPirate)
	    }
    
	for(var p=0; p<6; p++){
	    if file_exists(argument0 + "\\pirate" + string(p) + ".ini")
	        newPirate = LoadPirate(argument0 + "\\pirate" + string(p) + ".ini")
	    }

}
