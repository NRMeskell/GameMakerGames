/// @description Turtle Events

ds_list_add(locations, global.seaNames[1])

if myState != "unmet"{
	result = irandom(myVar + searchReputationType("nature")[0])
	myStates = ["waiting", "waiting", "waiting", "small", "small", "med", "special"]
	myState = myStates[min(result, 6)]
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

