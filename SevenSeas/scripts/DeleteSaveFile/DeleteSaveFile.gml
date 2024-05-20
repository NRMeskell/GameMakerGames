function DeleteSaveFile(argument0) {
	myFiles = ReadAllSaveFiles()

	saveFile = file_text_open_write("saveGames.txt")

	for(i=0; i<array_length_1d(myFiles); i++){
	    if myFiles[i] != argument0{
	        file_text_write_string(saveFile, myFiles[i] + chr(10))
	        }
	    else{
	        file_delete(argument0 + "-MapSeaVarsFile.txt")
	        file_delete(argument0 + "-MapSurfaceFile.png")
	        file_delete(argument0 + "-MapLandingFile.txt")
	        file_delete(argument0 + "-BuildingFile.ini")
	        file_delete(argument0 + "-characters.ini")
			file_delete(argument0 + "-gameStats.ini")
			file_delete(argument0 + "-reputation.ini")
	        for(p=0; p<10; p++)
	            file_delete(argument0 + "-pirate" + string(p) + ".ini")
	        file_delete(argument0 + "-ship.ini")
	        file_delete(argument0 + "-mapGrid.ini")
	        }
	    }

	file_text_close(saveFile)




}
