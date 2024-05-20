/// @description  @description RemovePunctuation(string)
/// @param string
function RemovePunctuation(argument0) {

	var myString = string_replace(argument0, "!", "")
	myString = string_replace(myString, "?", "")
	myString = string_replace(myString, ".", "")

	return myString



}
