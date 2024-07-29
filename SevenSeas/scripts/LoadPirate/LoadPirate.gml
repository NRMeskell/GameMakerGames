function LoadPirate(argument0) {
	pirate = CreatePirate(false)

	ini_open(argument0)
  
	//looks
	pirate.firstName = ini_read_string("looks", "firstName", pirate.firstName)
	pirate.lastName = ini_read_string("looks", "lastName", pirate.lastName)
	pirate.name = pirate.firstName + " " + pirate.lastName

	pirate.myMainPer = real(ini_read_string("looks", "myMainPer", pirate.myMainPer)) mod 4
	pirate.mySecondPer = real(ini_read_string("looks", "mySecondPer", pirate.mySecondPer)) mod 4
	pirate.myGender = bool(ini_read_string("looks", "gender", pirate.myGender))
	pirate.skinColor = real(ini_read_string("looks", "skinColor", pirate.skinColor))
	pirate.face = real(ini_read_string("looks", "face", pirate.face))
	pirate.body = real(ini_read_string("looks", "body", pirate.body))
	pirate.beard = real(ini_read_string("looks", "beard", pirate.beard))
	pirate.hair = real(ini_read_string("looks", "hair", pirate.hair))
	pirate.hairColor = real(ini_read_string("looks", "hairColor", pirate.hairColor))
	pirate.myGoal = ini_read_string("looks", "goal", pirate.myGoal)
	pirate.myGoalProgress = ini_read_real("looks", "goalProg", irandom(global.seaLevel))
	if pirate.myGender{
	    pirate.mySkin = PirateManSkinSpr
	    pirate.myFace = PirateManFaceSpr
	    }
	else{
	    pirate.mySkin = PirateWomanSkinSpr
	    pirate.myFace = PirateWomanFaceSpr
	    }
		
	ds_list_clear(pirate.myRequestList)
	var readReqNum = min(2, ini_read_real("requests", "num", 2))
	for(var i=0; i<readReqNum; i++){
		request = asset_get_index(ini_read_string("requests", "req" + string(i), script_get_name(EventController.requestLists[pirate.myMainPer][irandom(2)])))
		ds_list_add(pirate.myRequestList, request)
	}

	//speech
	ds_map_clear(pirate.myPirateDict)
	for (r=0; r<100; r++) {
	    if ini_key_exists("speech", "key" + string(i)){
	        var entry = SplitLine(ini_read_string("speech", "key" + string(i), "none"), ",")
	        ds_map_add(pirate.myPirateDict, entry[0], entry[1])
	        }
	    }

	//pirate
	for(i=0; i<3; i++){
	    if ini_read_string("stats", "action" + string(i), "none") != "none"
	        pirate.myAction[i] = asset_get_index(ini_read_string("stats", "action" + string(i), "none"))
	    else
	        pirate.myAction[i] = noone
	    }
	for(i=0; i<9; i++){
	    pirate.stat[i] = ini_read_real("stats", "stat" + string(i), 0)
	    }
	pirate.eyeLostRight = bool(ini_read_string("stats", "reye", pirate.eyeLostRight))
	pirate.eyeLostLeft = bool(ini_read_string("stats", "leye", pirate.eyeLostLeft))
	pirate.legLostRight = bool(ini_read_string("stats", "rleg", pirate.legLostRight))
	pirate.legLostLeft = bool(ini_read_string("stats", "lleg", pirate.legLostLeft))
	pirate.handLostRight = bool(ini_read_string("stats", "rhand", pirate.handLostRight))
	pirate.handLostLeft = bool(ini_read_string("stats", "lhand", pirate.handLostLeft))
	pirate.maxHealth = real(ini_read_string("stats", "maxHealth", pirate.maxHealth))
	pirate.myHealth = real(ini_read_string("stats", "myHealth", pirate.myHealth))
	//pirate.injured = bool(ini_read_string("stats", "injured", pirate.injured))
	pirate.morale = real(ini_read_string("stats", "morale", pirate.morale))
	pirate.prevMorale = pirate.morale
	pirate.healthDiff = pirate.myHealth

	//equipment

	EquipItem(pirate, LoadItem(ini_read_string("equipment", "shirt", SaveItem(pirate.myShirt))))
	EquipItem(pirate, LoadItem(ini_read_string("equipment", "pants", SaveItem(pirate.myPants))))
	EquipItem(pirate, LoadItem(ini_read_string("equipment", "hat", SaveItem(pirate.myHat))))
	EquipItem(pirate, LoadItem(ini_read_string("equipment", "pet", SaveItem(pirate.myPet))))

	EquipItem(pirate, LoadItem(ini_read_string("equipment", "rhand", SaveItem(pirate.myRightHand))))

	if !pirate.myRightHand.twoHanded
	    EquipItem(pirate, LoadItem(ini_read_string("equipment", "lhand", SaveItem(pirate.myLeftHand))))
    
	//ship slots
	newSlot = instance_find(ShipSlot, real(ini_read_string("ship", "slot", 2)))
	newMainSlot = instance_find(ShipSlot, real(ini_read_string("ship", "mainSlot", 2)))

	newSlot.myThing = pirate.id
	pirate.mySlot.occupied = false
	newSlot.occupied = true
	pirate.mySlot = newSlot
	pirate.myMainSlot = newMainSlot

	ini_close()
}
