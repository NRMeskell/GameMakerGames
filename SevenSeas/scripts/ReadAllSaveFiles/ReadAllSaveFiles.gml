/// @description Reads the names of all save files
function ReadAllSaveFiles() {
	i=0

	myFiles = ""
	if file_exists("saveGames.txt"){
	    saveFiles = file_text_open_read("saveGames.txt")
	    while !file_text_eof(saveFiles){
	        fileString = file_text_read_string(saveFiles)
	        file_text_readln(saveFiles)
	        myFiles[i] = fileString
	        i++
	        }
	    }
    
	return myFiles



}
