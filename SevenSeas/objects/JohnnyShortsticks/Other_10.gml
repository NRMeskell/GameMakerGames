/// @description Johnny state switching


if myState == "at port" or myState == "unmet"{
    ds_list_add(locations, global.seaNames[0])
	if searchReputationType("repute")[0] > -2
		ds_list_add(myPortEvents, JohnnyArrive)
	else
		ds_list_add(myPortEvents, JohnnyArriveScared)
    }
else if myState == "on ship"{
    UpdateCharacterPortEvents(JohnnyRunOff)
	if searchReputationType("repute")[0] < -3
		UpdateCharacterEvents(JohnnyEatsFood, JohnnyScared)
	else if searchReputationType("repute")[0] < -1
		UpdateCharacterEvents(JohnnyEatsFood, JohnnySad)
	else
		UpdateCharacterEvents(JohnnyEatsFood, JohnnySings, JohnnyMakeItem, JohnnyGetInWay)
    for(i=0; i<7; i++)
        ds_list_add(locations, global.seaNames[i])
    }
else if myState == "stow away"{
    UpdateCharacterPortEvents()
    UpdateCharacterEvents(JohnnyStowaway)
    for(i=0; i<7; i++)
        ds_list_add(locations, global.seaNames[i])
    }
else if myState == 3{
    ///Johnny becomes angry
    UpdateCharacterEvents()
    UpdateCharacterPortEvents(JohnnyFurious)

    ds_list_add(locations, global.seaNames[0])
    }

