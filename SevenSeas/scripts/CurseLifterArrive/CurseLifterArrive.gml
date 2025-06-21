function CurseLifterArrive() {
	with instance_create(0,0,Event){
		if CurseLifter.myState == "unmet" or CurseLifter.myState == "fresh"
			myCharacter = 8
		else if CurseLifter.myState == "unwell"
			myCharacter = 9
		else if CurseLifter.myState == "dying"
			myCharacter = 10
			
	    buttonNumber = 3
	    ds_list_add(buttons, CurseLifterPass, GoldForLimb, CurseLifterLimb) 
	    ds_list_add(buttonStats, 0, 0, 0) 
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, 0, 0)
		if CurseLifter.myState != "dying"
			ds_list_add(buttonText, "decline her offer", "give limb for 25 gold", "give limb to lift curses")
		else
			ds_list_add(buttonText, "ignore her plea", "give limb for 25 gold", "give limb to lift curses")
			
		
	    global.allowSelect = false
	    captionText = "Mia CurseLifter"
	    if CurseLifter.myState == "unmet"
	        eventText = "The friendly woman offers to trade or lift curses for the price of one of the crew's limbs."
        if CurseLifter.myState == "fresh"
	        eventText = "Mia thanks the crew for their earlier business, and asks if they care for another trade?"
        if CurseLifter.myState == "unwell"
			eventText = "The friendly woman returns and asks if you'd please like to lift a curse from your ship."
		if CurseLifter.myState == "dying"
			eventText = "Mia pleads for her soul, which will be destroyed if she doesn't receive living flesh!"
		
		
		global.moraleBoost = "curselifter"
	}
}


function CurseLifterPass() {
	if CurseLifter.myState != "dying"{
		ds_list_add(global.notificationList, "Offer Declined!", "The woman is surprisingly disappointed, but wishes your crew well!")
		if CurseLifter.myState == "unwell"
			CurseLifter.myState = "dying"
		else
			CurseLifter.myState = "unwell"

	}else{
		ds_list_add(global.notificationList, "Plea Refused!", "Mia breaks down wailing! As she departs, you suspect you will never hear from her again...")
		instance_destroy(CurseLifter)
	}
}


function GoldForLimb() {	
	var limbName;
	var myPirate = RandomPirate()
	with myPirate{
		if myRightHand.itemName == "none" or myLeftHand.itemName == "none"
			limbName = "hand"
		else if stars < 3
			limbName = "eye"
		else
			limbName = "leg"
		event_user(limbName)
	}
	
	if CurseLifter.myState != "dying"
		ds_list_add(global.notificationList, "Trade Complete!", myPirate.firstName + "'s " + limbName + " comes magically free, and Mia happily trades it for 25 gold!")
	else
		ds_list_add(global.notificationList, "Mia Saved!", myPirate.firstName + "'s " + limbName + " comes magically free, and Mia gratefully receives it in tears.")
	
	GetRandomLoot(1, "Offer", [0])
	with StoreObjectStorable
		amount = 25
	
	CurseLifter.myState = "fresh"
	script_execute(closeEventCode)
}


function CurseLifterLimb() {
	var limbName;
	var myPirate = RandomPirate()
	with myPirate{
		if myRightHand.itemName == "none" or myLeftHand.itemName == "none"
			limbName = "hand"
		else if stars < 3
			limbName = "eye"
		else
			limbName = "leg"
		event_user(limbName)
	}
	
	var cursesLifted = LiftCurses()
	if cursesLifted == 0{
		if CurseLifter.myState != "dying"
			ds_list_add(global.notificationList, "No Curses!", "Mia doesn't find any curses to life and she leaves very dissapointed without taking a limb.")
		else{
			ds_list_add(global.notificationList, "Mia Saved!", myPirate.firstName + "'s " + limbName + " comes magically free, and Mia receives it in tears. No curses were found on the ship.")
		}
	}else{
		if CurseLifter.myState != "dying"
			ds_list_add(global.notificationList, "Curses Lifted!", "The woman lifts " + string(cursesLifted) + " curses, magically removes " + gonePirate.firstName + "'s " + limbName + ", and thanks your crew.")
		else
			ds_list_add(global.notificationList, "Curses Lifted!", "Mia lifts " + string(cursesLifted) + " curses, and receives " + gonePirate.firstName + "'s magically removed " + limbName + " with tears of joy!")
	}
	
	CurseLifter.myState = "fresh"
	script_execute(closeEventCode)
}

