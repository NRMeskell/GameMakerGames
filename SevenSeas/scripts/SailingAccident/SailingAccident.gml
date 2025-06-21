function SailingAccident() {
	with instance_create(0,0,Event)
	    {
		// Different Event Flavors
		// rope, boards, wheel
		var eventNum = irandom(2)
		var titles = ["Caught in Rigging!", "Smashed by Cargo", "Hit by yardarm"]
		var accidents = [" was caught in the rigging", " was crush under cargo", " was slammed in the head"]
	    var solutions = ["cut away the ropes", "splint the injuries", "allow for needed rest"]
		var eventStat = [3, 3, 5]
		var car = [false, true, false]
			
		eventValue = RandomPirate()
	    buttonNumber = 2
		
	    ds_list_add(buttons, SailingAccidentMed, SailingAccidentMed)
	    ds_list_add(buttonStats, eventStat[eventNum], 6)
	    ds_list_add(buttonRequires, car[eventNum] ? 0 : global.eventDiff[eventStat[eventNum], 1], global.eventDiff[6, 0])
	    ds_list_add(buttonCosts, car[eventNum] ? 1 : 0, 0)
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
		UpdateHealth(eventValue, -15 -10*global.seaLevel)
	}
	else{
		var limb; 
		with eventValue
			limb = LoseLimb(choose("arm", "leg"))
		ds_list_add(global.notificationList, "Limb removed!", "The crew's efforts were futile, and " + eventValue.firstName + "'s limb had to be amputated!")
	}
}

