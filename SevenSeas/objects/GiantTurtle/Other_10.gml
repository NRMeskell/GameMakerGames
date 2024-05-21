/// @description Turtle Events

ds_list_add(locations, global.seaNames[1])

if myState != "unmet"{
	result = irandom(myVar)
	myStates = ["waiting", "waiting", "small", "small", "med", "special"]
	myState = myStates[min(result, 5)]
}


if myState == "unmet" or myState == "waiting"{
    UpdateCharacterEvents(GiantTurtleArrive)
    }
else if myState == "small"{
    UpdateCharacterEvents(GiantTurtleSmall)
    }
else if myState == "med"{
    UpdateCharacterEvents(GiantTurtleMedium)
    }
else if myState == "special" {
    UpdateCharacterEvents(GiantTurtleSpecial)
    }
else{
	UpdateCharacterEvents(GiantTurtleArrive)
}

