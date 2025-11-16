/// @description Update Volcano State

myVar += 1
if myVar > 2{
	myVar = 0
	myState = "still"
}

if myVar < 2{
	UpdateCharacterEvents(VolcanoRumbling);
}else{
	UpdateCharacterEvents(VolcanoErupting);
}


