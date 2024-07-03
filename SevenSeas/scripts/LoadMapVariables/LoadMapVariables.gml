function LoadMapVariables(argument0) {
	writeFile = file_text_open_read(argument0 + "-MapSeaVarsFile.txt");

	for(n=0; n<MapCreator.seaNumber; n++){
	    currentLine = file_text_readln(writeFile)
	    currentData = SplitLine(currentLine)
	    ds_map_replace(MapCreator.seas[n], "x", real(currentData[0]))
	    ds_map_replace(MapCreator.seas[n], "y", real(currentData[1]))
	    ds_map_replace(MapCreator.seas[n], "dir", real(currentData[2]))
	    ds_map_replace(MapCreator.seas[n], "conquered", bool(currentData[3]))
	    ds_map_replace(MapCreator.seas[n], "enemy seen", bool(currentData[4]))
	    ds_map_replace(MapCreator.seas[n], "type", string(currentData[5]))
	    ds_map_replace(MapCreator.seas[n], "level", real(currentData[6]))
	    }
 
	currentLine = file_text_readln(writeFile)
	currentData = SplitLine(currentLine)   
	for(i=0; i<array_length_1d(MapCreator.winCond); i++){
	    MapCreator.winCond[i] = real(currentData[i])
	    }
    
	file_text_close(writeFile)

	//catch poorly made islands
	tempSea = ds_map_create()
	for(i=1; i<7; i+=2){
	    if ds_map_find_value(MapCreator.seas[i], "type") != global.seaNames[i]{
	        ds_map_copy(tempSea, MapCreator.seas[i])
	        ds_map_copy(MapCreator.seas[i], MapCreator.seas[i+1])
	        ds_map_copy(MapCreator.seas[i+1], tempSea)
	        }
	    }
	ds_map_destroy(tempSea)
	
	//MapCreator.seenBackground = background_add(argument0 + "-MapSeenFile.png", false, false)
	/*if surface_exists(MapCreator.seenSurface)
		surface_free(MapCreator.seenSurface)*/
}
