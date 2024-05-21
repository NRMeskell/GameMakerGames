/// @description Johnny state switching


if myState == "at port" or myState == "unmet"{
    ds_list_add(locations, global.seaNames[0])
	ds_list_add(myPortEvents, JohnnyArrive)
	myVar = 0
    }
else if myState == "on ship"{
    UpdateCharacterPortEvents(JohnnyRunOff)
	UpdateCharacterEvents(JohnnyEatsFood, JohnnySings, JohnnyMakeItem, JohnnyGetInWay)
    if myVar = 1{
		myVar = 0
		UpdateCharacterEvents(JohnnyScared)
	}
	for(i=0; i<7; i++)
        ds_list_add(locations, global.seaNames[i])
    }
else if myState == "stow away"{
    UpdateCharacterPortEvents()
    UpdateCharacterEvents(JohnnyStowaway)
    for(i=0; i<7; i++)
        ds_list_add(locations, global.seaNames[i])
	myVar = 0
    }
else if myState == 3{
    ///Johnny becomes angry
    UpdateCharacterEvents()
    UpdateCharacterPortEvents(JohnnyFurious)
	myVar = 0
    ds_list_add(locations, global.seaNames[0])
    }

