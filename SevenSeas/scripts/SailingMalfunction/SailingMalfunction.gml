function SailingMalfunction() {
	with instance_create(0,0,Event)
	    {
		eventValue = RandomPirate()
	    buttonNumber = 2
	    ds_list_add(buttons, MalfunctionShip, MalfunctionCrew)
	    ds_list_add(buttonStats, 3, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[6, 1])
	    ds_list_add(buttonCosts, global.seaLevel+1, 0)
	    ds_list_add(buttonText, "reinforce the#breaking ship" , "attend to the#injured crew")
        
	    global.allowSelect = false
	    var eventNum = irandom(3)
		var accidents = ["A rope rips free", "A decking board breaks", "A small sail tears free,"]
	    var titles = ["Loose Rope!", "Broken Plank!", "Torn Sail!"]
	
	    captionText = titles[eventNum]
		var accident =  accidents[eventNum]
	    eventText = accident + ", and " + eventValue.name + " was caught in the damage!" 
	    
		global.moraleBoost = "malfunction"
	    }
}

function MalfunctionShip(){	
	if argument0{
		ds_list_add(global.notificationList, "Ship Repaired!", "The crew is quick to repair the damage! " + eventValue.firstName + "'s injuries go untreated...")
		eventValue.myHealth -= eventValue.maxHealth div 4
	}
	else{
		MalfunctionFail()
	}
}

function MalfunctionCrew(){
	if argument0{
		ds_list_add(global.notificationList, "Injuries Treated!", eventValue.firstName + "'s wounds are quickly addressed! The ship's damage goes unaddressed...")
		Ship.myHealth -= Ship.maxHealth div 6
	}
	else{
		MalfunctionFail()
	}
}

function MalfunctionFail(){
	ds_list_add(global.notificationList, "Failed Attempt!", "The damage was greater than expected, and neither the ship nor crew could be helped.")
	eventValue.myHealth -= maxHealth div 4
	Ship.myHealth -= Ship.maxHealth div 6
}

