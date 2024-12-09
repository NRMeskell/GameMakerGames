function BlackSpotArrives() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, BlackSpotLeave, BlackSpotRemove)
	    ds_list_add(buttonStats, 0, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[6,2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "hope it goes away", "remove the spot")
        
		myPirate = RandomPirate()
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
	with instance_create(0,0, ConditionTimer){
		myPirate = other.myPirate
		myEvent = BlackSpotResolve
	}
}

function BlackSpotRemove() {
	if argument0{
		ds_list_add(global.notificationList, "Black spot removed!", "It appears to have been some dirt.")
	}
	else{
		ds_list_add(global.notificationList, "black spot remains", "No matter how hard the area is scrubbed and cut, the spot doesn't come off! The crew begin to worry...")
		myPirate.myHealth -= 20
		with myPirate{
			UpdateMorale(-1, -1)
			UpdateMorale(-1, global.JOLLY)
		}
		UpdateMorale(-1, -1)
		
		with instance_create(0,0, ConditionTimer){
			myPirate = other.myPirate
			myEvent = BlackSpotResolve
		}
	}
}

function BlackSpotResolve(){
	if irandom(1){
		with myPirate{
			event_user(3)
		}
		ds_list_add(global.notificationList, "Black Spot!", myPirate.name + "'s black spot grows larger, and then disappears... along with a part of their body!")
	}
	else{
		ds_list_add(global.notificationList, "Black Spot Gone!", myPirate.name + "'s black spot has gone away in the night. They hope it doesn't come back!")
	}
}

