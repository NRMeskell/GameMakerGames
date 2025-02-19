function SaveMapVariables(argument0) {
	writeFile = file_text_open_write(argument0 + "\\MapSeaVarsFile.txt");

	for(n=0; n<MapCreator.seaNumber; n++){
	    seaX = ds_map_find_value(MapCreator.seas[n], "x")
	    seaY = ds_map_find_value(MapCreator.seas[n], "y")
	    seaDir = ds_map_find_value(MapCreator.seas[n], "dir")
	    seaConq = ds_map_find_value(MapCreator.seas[n], "conquered")
	    //seaConqCond = ds_map_find_value(MapCreator.conditions, ds_map_find_value(MapCreator.seas[n], "type"))
	    seaES = ds_map_find_value(MapCreator.seas[n], "enemy seen")
	    seaType = ds_map_find_value(MapCreator.seas[n], "type")
	    seaLevel = ds_map_find_value(MapCreator.seas[n], "level")
    
	    file_text_write_string(writeFile, string(seaX)+","+string(seaY)+","+string(seaDir)+","+string(seaConq)+","+string(seaES)+","+string(seaType)+","+string(seaLevel)+","+chr(10));
	    }
    
	winConds = ""
	for(i=0; i<array_length_1d(MapCreator.winCond); i++)
	    winConds += string(MapCreator.winCond[i])+","
	    file_text_write_string(writeFile, winConds)
    
	file_text_close(writeFile)
}
