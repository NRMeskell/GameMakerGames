function HowlingWinds() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, HowlHoldFast, HowlSail, HowlBelowDeck)
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 3], global.eventDiff[5, 1])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "hold fast", "sail on the wind", "get the crew below decks")
        
	    global.allowSelect = false
	    captionText = "Moaning Winds!"
    
	    eventText = "An unnatural wind blows across the deck with a strange bite and unsettling cry."
	    global.moraleBoost = "wind"  
	    }
}

function HowlHoldFast() {
	ds_list_add(global.notificationList, "biting air", "the wind bites through the crew and deck, scaring and injuring the crew!")
	UpdateMorale(-1, -1)
	with Pirate 
		myHealth -= 10
	with Ship 
		myHealth *= 0.9
}

function HowlSail() {
	if argument0{
		ds_list_add(global.notificationList, "Sudden Arrival!", "The winds catch the sails and the crew quickly find themselves, quite mysteriously, at shore.")
		UpdateMorale(1, -1)
	}
	else{
		ds_list_add(global.notificationList, "biting air", "the wind bites through the crew and deck, scaring and injuring the exposed crew as they climb the masts!")
		UpdateMorale(-1, -1)
		with Pirate 
			myHealth -= 20
		with Ship 
			myHealth *= 0.9
	}
	closeEventCode()
}

function HowlBelowDeck(){
	if argument0{
		ds_list_add(global.notificationList, "spooky sounds!", "The winds blows across the deck, howling and biting the wood in an unnatural way.")
		UpdateMorale(1, -1)
		with Ship 
			myHealth *= 0.9
	}
	else{
		ds_list_add(global.notificationList, "crew paralyzed", "the howls captivate the crew, who are compelled to stand exposed in the biting winds!")
		UpdateMorale(-1, -1)
		with Pirate 
			myHealth -= 20
		with Ship 
			myHealth *= 0.9
	}
	closeEventCode()
}

