function HowlingWinds() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, HowlHoldFast, HowlBelowDeck, HowlSail)
	    ds_list_add(buttonStats, 0, 5, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[5, 1], global.eventDiff[3, 3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "hold fast to save ship", "get crew below decks", "sail on the wind")
        
	    global.allowSelect = false
	    captionText = "Moaning Winds!"
    
	    eventText = "An unnatural wind blows across the deck with a strange bite and unsettling cry."
	    global.moraleBoost = "wind"  
		
		mySound = audio_play_sound(HowlingWindSnd, 0, true)
	    }
}

function HowlHoldFast() {
	ds_list_add(global.notificationList, "biting air", "the wind bites through the crew and deck!")
	UpdateMorale(-1, -1)
	with Pirate 
		UpdateHealth(id, -20)
	with Ship 
		UpdateHealth(id, -80)
		
	audio_stop_sound(mySound)
}

function HowlSail() {
	if argument0{
		ds_list_add(global.notificationList, "Sudden Arrival!", "The winds catch the sails and the crew find themselves suddenly at shore.")
		UpdateMorale(1, -1)
	}
	else{
		ds_list_add(global.notificationList, "biting air", "the wind bites through the exposed crew as they climb the masts!")
		UpdateMorale(-1, -1)
		with Pirate 
			UpdateHealth(id, -35)
		with Ship 
			UpdateHealth(id, -100)
	}
	audio_stop_sound(mySound)
	closeEventCode()
}

function HowlBelowDeck(){
	if argument0{
		ds_list_add(global.notificationList, "spooky sounds!", "The winds blows across the deck, howling and biting into the wood.")
		UpdateMorale(1, -1)
		with Ship 
			UpdateHealth(id, -100)
	}
	else{
		ds_list_add(global.notificationList, "crew paralyzed", "the howls captivate the crew, who are compelled to stand exposed in the biting winds!")
		UpdateMorale(-1, -1)
		with Pirate 
			UpdateHealth(id, -35)
		with Ship 
			UpdateHealth(id, -150)
	}
	audio_stop_sound(mySound)
	closeEventCode()
}

