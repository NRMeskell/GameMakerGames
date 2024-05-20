/// @description Silverwheel level up

ds_list_add(locations, global.seaNames[0], global.seaNames[1], global.seaNames[2])


if myState == "unmet" or myState == "free"{
    UpdateCharacterEvents(SilverwheelArrive)
    }
else if myState == "trade"{
	if searchReputationType("repute")[0] > 2{
		UpdateCharacterEvents(SilverwheelHappy)
    }
	else if searchReputationType("repute")[0] < -2{
		UpdateCharacterEvents(SilverwheelAnnoyed)
    }
	else if searchReputationType("repute")[0] < -5{
		UpdateCharacterEvents(SilverwheelChallenge)
    }
	else{
		UpdateCharacterEvents(SilverwheelTrade)
	}
}

