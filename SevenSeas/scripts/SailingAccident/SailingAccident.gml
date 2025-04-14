function SailingAccident() {
	with instance_create(0,0,Event)
	    {
		eventValue = RandomPirate()
	    buttonNumber = 2
	    ds_list_add(buttons, SailingAccidentRope, SailingAccidentMed)
	    ds_list_add(buttonStats, 3, 6)
	    ds_list_add(buttonRequires, global.eventDiff[3, 1], global.eventDiff[6, 0])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "roughly wrap the injury" , "carefully treat their wounds")
        
				global.allowSelect = false
		
		var eventNum = irandom(2)
		var accidents = [" was hit by a yardarm", " was caught in the rigging", " was knocked off their feet"]
	    var titles = ["Hit by Beam!", "Caught in Rigging!", "Thrown To Deck!"]
	
	    captionText = titles[eventNum]
		var accident =  accidents[eventNum]
	    eventText = eventValue.name + accident + ", and they lie injured on the deck!" 
	    global.moraleBoost = "accident"
	    }
}

function SailingAccidentRope(){	
	if argument0{
		ds_list_add(global.notificationList, "Bandage applied!", "The wound is hastily dressed, but " + eventValue.firstName + " does not make full recovery.")
		eventValue.myHealth *= 0.75
	}
	else{
		SailingAccidentFail()
	}
}

function SailingAccidentMed(){
	if argument0{
		ds_list_add(global.notificationList, "Successful Care!", "The wounds are carefully treated, and " + eventValue.firstName + " walks away unharmed.")
	}
	else{
		SailingAccidentFail()
	}
}

function SailingAccidentFail(){
	if irandom(2){
		ds_list_add(global.notificationList, "Blood Loss!", "The wounds are deep and the crew cannot stop the bleeding in time.")
		eventValue.myHealth -= 20 + 10*global.seaLevel
	}
	else{
		ds_list_add(global.notificationList, "Limb removed!", "The crew's efforts were futile, and " + eventValue.firstName + "'s limb had to be amputated!")
		with eventValue
			event_user(3)
	}
}

