function SplitLine(argument0) {
	//Split Line @description SplitLine(comma seperated string)

	totalString = argument0
	myIndex = 0
	while totalString != ""{
	    currentString = ""
	    i = 1
	    while (string_char_at(totalString, i) != ",") and (string_char_at(totalString, i) != chr(10) and (string_char_at(totalString, i) != "")){
	        currentString = currentString + string_char_at(totalString, i)
	        i++
	        }
	    splitArray[myIndex] = currentString
	    myIndex ++
	    totalString = string_copy(totalString, i+1, string_length(totalString) - i)
	    }
    
	return splitArray



}
