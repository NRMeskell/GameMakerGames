function SailingAccident() {
	with instance_create(0,0,Event)
	    {
		// Different Event Flavors
		// rope, boards, wheel
		var eventNum = irandom(3)
		var titles = ["Caught in Rigging!", " smashed by Cargo", "Hit by yardarm"]
		var accidents = [" was caught in the rigging", " was crush under cargo", " was slammed in the head"]
	    var solutions = ["cut away the ropes", "quickly splint the injuries", "h"]
		var eventStat = [3, 3, 5, 5]
		var car = [false, true, false, true]
			
		eventValue = RandomPirate()
	    buttonNumber = 2
		
	    ds_list_add(buttons, SailingAccidentMed, SailingAccidentMed)
	    ds_list_add(buttonStats, eventStat, 6)
	    ds_list_add(buttonRequires, !car ? global.eventDiff[eventStat, 1] : 0, global.eventDiff[6, 0])
	    ds_list_add(buttonCosts, car ? 1 : 0, 0)
	    ds_list_add(buttonText, solutions[eventNum] , "provide medical care")
        global.allowSelect = false
		
	    captionText = titles[eventNum]
		var accident =  accidents[eventNum]
	    eventText = eventValue.name + accident + ", and is in danger of serious harm!" 
	    global.moraleBoost = "accident"
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
		eventValue.myHealth -= 15 + 10*global.seaLevel
	}
	else{
		ds_list_add(global.notificationList, "Limb removed!", "The crew's efforts were futile, and " + eventValue.firstName + "'s limb had to be amputated!")
		with eventValue
			event_user(3)
	}
}

