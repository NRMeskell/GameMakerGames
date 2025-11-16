/// @description Turtle Events

ds_list_add(locations, global.seaNames[1], global.seaNames[5])

if myState != "unmet"{
	var myStates = ["waiting", "small", "med", "special"]
	myState = myStates[min(3,max(irandom(myVar), irandom(myVar)))]
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

