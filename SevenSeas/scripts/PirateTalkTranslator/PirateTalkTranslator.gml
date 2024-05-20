function PirateTalkTranslator(argument0, argument1) {
	newString = argument0
	newString = " " + newString + " "
	pun = ".?!;:/,-"
	for(i=0; i<string_length(pun); i++)
	    {
	    newString = string_replace_all(newString, string_char_at(pun, i), " " + string_char_at(pun, i))
	    }

	for(currentWord = ds_map_find_first(argument1.myPirateDict); !is_undefined(currentWord); currentWord = ds_map_find_next(argument1.myPirateDict, currentWord)) 
	    {
	    newString = string_replace_all(newString, currentWord, argument1.myPirateDict[? currentWord])
	    }
    
	for(i=0; i<string_length(pun); i++)
	    {
	    newString = string_replace_all(newString, " " + string_char_at(pun, i), string_char_at(pun, i))
	    }
    
	newString = string_copy(newString, 2, string_length(newString) - 2);
    
	return newString



}
