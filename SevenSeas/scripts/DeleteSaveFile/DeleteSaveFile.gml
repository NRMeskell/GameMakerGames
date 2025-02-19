function DeleteSaveFile(argument0) {
	myFiles = ReadAllSaveFiles()

	saveFile = file_text_open_write("saveGames.txt")

	for(i=0; i<array_length_1d(myFiles); i++){
	    if myFiles[i] != argument0{
	        file_text_write_string(saveFile, myFiles[i] + chr(10))
	        }
	    else{
	        directory_destroy(argument0)
	        }
	    }

	file_text_close(saveFile)
}
