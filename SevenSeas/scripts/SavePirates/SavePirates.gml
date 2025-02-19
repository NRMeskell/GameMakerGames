function SavePirates(argument0) {
	for(p=0; p<6; p++){
	    if file_exists(argument0 + "\\pirate" + string(p) + ".ini")
	        file_delete(argument0 + "\\pirate" + string(p) + ".ini")
	}

	for(p=0; p<instance_number(Pirate); p++){
	    myPirate = instance_find(Pirate, p)
	    myFile = argument0 + "\\pirate" + string(p) + ".ini"
	    SavePirate(myPirate, myFile)
	}




}
