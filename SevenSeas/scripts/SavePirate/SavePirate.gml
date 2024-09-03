function SavePirate(argument0, argument1) {
	pirate = argument0
	ini_open(argument1)

	//looks
	ini_write_string("looks", "firstName", pirate.firstName)
	ini_write_string("looks", "lastName", pirate.lastName)
	ini_write_string("looks", "myMainPer", pirate.myMainPer)
	ini_write_string("looks", "mySecondPer", pirate.mySecondPer)
	ini_write_string("looks", "gender", pirate.myGender)
	ini_write_string("looks", "skinColor", pirate.skinColor)
	ini_write_string("looks", "face", pirate.face)
	ini_write_string("looks", "body", pirate.body)
	ini_write_string("looks", "beard", pirate.beard)
	ini_write_string("looks", "hair", pirate.hair)
	ini_write_string("looks", "hairColor", pirate.hairColor)
	ini_write_string("looks", "goal", pirate.myGoal)
	ini_write_real("looks", "goalProg", pirate.myGoalProgress)

	//speech
	var i=0;
	for (var k = ds_map_find_first(pirate.myPirateDict); !is_undefined(k); k = ds_map_find_next(pirate.myPirateDict, k)) {
	  ini_write_string("speech", "key" + string(i), k + "," + pirate.myPirateDict[? k])
	  i++;
	}

	//pirate
	for(i=0; i<3; i++){
	    if pirate.myAction[i] == noone
	        ini_write_string("stats", "action" + string(i), "none")
	    else
	        ini_write_string("stats", "action" + string(i), object_get_name(pirate.myAction[i]))
	}
	for(i=0; i<9; i++){
	    ini_write_real("stats", "stat" + string(i), pirate.stat[i])
	}
	ini_write_string("stats", "reye", pirate.eyeLostRight)
	ini_write_string("stats", "leye", pirate.eyeLostLeft)
	ini_write_string("stats", "rleg", pirate.legLostRight)
	ini_write_string("stats", "lleg", pirate.legLostLeft)
	ini_write_string("stats", "rhand", pirate.handLostRight)
	ini_write_string("stats", "lhand", pirate.handLostLeft)
	ini_write_string("stats", "maxHealth", pirate.maxHealth)
	ini_write_string("stats", "myHealth", pirate.myHealth)
	ini_write_string("stats", "morale", pirate.morale)
	
	//equipment
	ini_write_string("equipment", "shirt", SaveItem(pirate.myShirt))
	ini_write_string("equipment", "pants", SaveItem(pirate.myPants))
	ini_write_string("equipment", "hat", SaveItem(pirate.myHat))
	ini_write_string("equipment", "pet", SaveItem(pirate.myPet))

	ini_write_string("equipment", "rhand", SaveItem(pirate.myRightHand))
	if !pirate.myRightHand.twoHanded
	    ini_write_string("equipment", "lhand", SaveItem(pirate.myLeftHand))
	else
	    ini_write_string("equipment", "lhand", "none")
    
	for(i=0; i<instance_number(ShipSlot); i++){
	    if pirate.mySlot.id = instance_find(ShipSlot, i).id
	        ini_write_string("ship", "slot", i)
		if pirate.myMainSlot.id = instance_find(ShipSlot, i).id
	        ini_write_string("ship", "mainSlot", i)
	    }

	ini_close()
}
