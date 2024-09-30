function CurseLifterArrive() {
	with instance_create(0,0,Event){
		if CurseLifter.myState == "unmet" or CurseLifter.myState == "fresh"
			myCharacter = 8
		else if CurseLifter.myState == "unwell"
			myCharacter = 9
			
	    buttonNumber = 3
	    ds_list_add(buttons, CurseLifterPass, GoldForLimb, CurseLifterLimb) 
	    ds_list_add(buttonStats, 0, 0, 0) 
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, 0, 0)
		if CurseLifter.myState == "unmet" or CurseLifter.myState == "fresh" or CurseLifter.myState == "passed"
			ds_list_add(buttonText, "decline her offer", "give limb for 25 gold", "give limb to lift curses")
		else
			ds_list_add(buttonText, "ignore her plea", "give limb for 25 gold", "give limb to lift curses")
			
		
	    global.allowSelect = false
	    captionText = "Mia CurseLifter"
	    if CurseLifter.myState == "unmet"
	        eventText = "A friendly woman approaches. She offers to trade, or lift curses, for a single limb from the crew."
        if CurseLifter.myState == "fresh"
	        eventText = "Mia thanks the crew for their earlier business, and asks if they care for another trade?"
        if CurseLifter.myState == "unwell"
			eventText = "The friendly woman returns and asks if you'd please like to lift a curse from your ship."
		if CurseLifter.myState == "dying"
			eventText = "Mia explains that her soul shall be cast away if she doesn't recieve living flesh, and begs for help."
		
		
		global.moraleBoost = "curselifter"
	}
}


function CurseLifterPass() {
	if CurseLifter.myState != "unwell"{
		ds_list_add(global.notificationList, "Offer Declined!", "The woman is surprisingly dissapointed, but wishes your crew well!")
		CurseLifter.myState = "unwell"
		
		with CurseLifter
			event_user(1)
	}else{
		CurseLifter.myState = "dying"
		ds_list_add(global.notificationList, "Plea Refused!", "Mia breaks down wailing! As she departs, you suspect you will never hear from her again...")
		instance_destroy(CurseLifter)
	}
    
	script_execute(closeEventCode)
}


function GoldForLimb() {	
	var myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	with myPirate
		event_user(3)
	
	if CurseLifter.myState != "dying"
		ds_list_add(global.notificationList, "Trade Complete!", myPirate.firstName + "'s limb comes magically free, and Mia happily trades it for 25 gold!")
	else
		ds_list_add(global.notificationList, "Mia Saved!", myPirate.firstName + "'s limb comes magically free, and Mia gratefully recieves it in tears.")
	
	GetRandomLoot(1, "Offer", [0])
	with StoreObjectStorable
		amount = 25
	
	CurseLifter.myState = "fresh"
	with CurseLifter
		event_user(1)
	script_execute(closeEventCode)
}


function CurseLifterLimb() {
	var pirates = ds_list_create()
	var cursesLifted = 0
	for(var i=0; i<instance_number(Pirate); i++){
		var checkPirate = instance_find(Pirate, i)
		if checkPirate.body == sprite_get_number(PirateManSkinSpr) -1{
			checkPirate.face = myMainPer * 2 + irandom(1)
			checkPirate.body = irandom(sprite_get_number(PirateManSkinSpr)-2)
			cursesLifted ++;
			with checkPirate{
				UpdateMorale(3, -1)
				if surface_exists(fullPirateSurface)
					MakePirateSurface(fullPirateSurface, 0, 0)
				if surface_exists(smallPirateSurface)
					MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
				if surface_exists(tagPirateSurface)
					MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)
			}
			ds_list_add(pirates, checkPirate, checkPirate, checkPirate)
		}
		if string_starts_with(checkPirate.myShirt.itemName, "Cursed"){
			checkPirate.myShirt.itemName = "Skeletal Coat"
			checkPirate.myShirt.itemInfo = "A bicorn, now restored to it's former glory"
			cursesLifted ++;
			ds_list_add(pirates, checkPirate)
		}
		if string_starts_with(checkPirate.myHat.itemName, "Cursed"){
			checkPirate.myHat.itemName = "Skeletal Hat"
			checkPirate.myHat.itemInfo = "A bicorn, now restored to it's former glory"
			ds_list_add(pirates, checkPirate)
			cursesLifted ++;
		}
		if string_starts_with(checkPirate.myPants.itemName, "Cursed"){
			checkPirate.myPants.itemName = "Skeletal Boots"
			checkPirate.myPants.itemInfo = "work boots, now restored to their former glory"
			ds_list_add(pirates, checkPirate)
			cursesLifted ++;
		}
	}
	
	if cursesLifted == 0{
		if CurseLifter.myState != "dying"
			ds_list_add(global.notificationList, "No Curses!", "Mia is dissapointed to not find a curse, and she leaves without a trade.")
		else
			ds_list_add(global.notificationList, "Mia Saved!", myPirate.firstName + "'s limb comes magically free, and Mia recieves it in tears. However, no curses were found on the ship.")
	}else{
		var gonePirate = ds_list_find_value(pirates, irandom(ds_list_size(pirates)-1))
		if CurseLifter.myState != "dying"
			ds_list_add(global.notificationList, "Curses Lifted!", "The woman lifts " + string(cursesLifted) + " curses, magically removes " + gonePirate.firstName + "'s limb, and thanks your crew.")
		else
			ds_list_add(global.notificationList, "Curses Lifted!", "Mia lifts " + string(cursesLifted) + " curses, and receives " + gonePirate.firstName + "'s magically removed limb with tears of joy!")
		
		with gonePirate
			event_user(3)
	}
	
	CurseLifter.myState = "fresh"
	with CurseLifter
		event_user(1)
	script_execute(closeEventCode)
}

