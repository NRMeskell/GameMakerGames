function AddSaveFile(argument0) {
	//Add Save File

	//add to list of games
	currentFile = file_text_open_append("saveGames.txt")
	file_text_write_string(currentFile, argument0 + chr(10))
	file_text_close(currentFile)






}
