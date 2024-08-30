function BlackSpotArrives() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, BlackSpotLeave, BlackSpotRemove)
	    ds_list_add(buttonStats, 0, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[6,2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "hope it goes away", "try to remove the spot")
        
		myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    global.allowSelect = false
	    captionText = "Black Spot!"
    
	    eventText = "A black spot has appeared on " + myPirate.name + "'s arm!"
	    global.moraleBoost = "spot"  
	    }
}

function BlackSpotLeave() {
	ds_list_add(global.notificationList, "spot left alone!", myPirate.firstName + " begins to worry...")
	with myPirate{
		UpdateMorale(-1, -1)
		UpdateMorale(-1, global.JOLLY)
	}
}

function BlackSpotRemove() {
	if argument0{
		ds_list_add(global.notificationList, "Black spot removed!", "It appears to have been some dirt.")
	}
	else{
		ds_list_add(global.notificationList, "black spot remains", "It stays, no matter how hard the area is scrubbed. Even cutting it off doesn't seem to work...")
		myPirate.myHealth -= 10
		with myPirate
			UpdateMorale(-2, -1)
			
		with instance_create(0,0, ConditionTimer){
			myPirate = other.myPirate
			myEvent = BlackSpotResolve
		}
	}
}

function BlackSpotResolve(){
	with myPirate{
		event_user(3)
	}
	ds_list_add(global.notificationList, "Black Spot!", myPirate.name + "'s black spot grows larger, and then disappears...alone with a part of their body!")
}

