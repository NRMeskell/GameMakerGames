function CrashingRocksArrive() {
	with instance_create(0,0,Event)
	    {
		myCharacter = 7
	    buttonNumber = 3
		
		var raceEventDiff = global.eventDiff[3, 3]*2 - CrashingRocks.myVar
		var navEventDiff = global.eventDiff[5, 3]*2 - CrashingRocks.myVar/2
		
		for(var i=0; i<instance_number(Pirate); i++){
			if instance_find(Pirate, i).myPet.itemPower = "crashing rocks"{
				raceEventDiff -= 2
				navEventDiff -= 1
			}
		}
		raceEventDiff = max(0, raceEventDiff)
		navEventDiff = max(0, navEventDiff)
		
		ds_list_add(buttons, CrashingSailPass, CrashingRace, CrashingNavigate)		
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, raceEventDiff, navEventDiff)
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "sail around the rocks", "race between the rocks", "steer between the rocks")
        
		global.moraleBoost = "crashing rocks"
	    global.allowSelect = false
		
	    captionText = "Crashing Rocks"
	    myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		if CrashingRocks.myState == "unmet"
			eventText = "The two enourmous stones tower from the water and crash together!" 
	    else
	        eventText = "The giant stones appear again, although you swear they weren't here before." 
		CrashingRocks.myState = "met"
		CrashingRocks.myVar += 1
		
		instance_create(0,0,CrashingRocksEvent)
		}
}

function CrashingSailPass(){
	ds_list_add(global.notificationList, "Rocks Passed!", "The sound of crashing stone slowly fades away behind you")
	closeEventCode()
}

function CrashingRace(){
	with CrashingRocksEvent
		goBetween = true
		
	if argument0{
		CrashingRocksEvent.result = "Successful Passage!"
		CrashingRocksEvent.description = "The crew expertly speeds through the rough water, and escape from between the stones just before they crash together!"
		CrashingRocksEvent.sailing = true
		CrashingRocksEvent.success = true
		
		instance_destroy(CrashingRocks)
	}
	else{
		CrashingRocksEvent.result = "smashed by rocks!"
		CrashingRocksEvent.description = "The crew's best efforts were not enough, and the rocks crash into the ship!"
		CrashingRocksEvent.sailing = true
		CrashingRocksEvent.success = false
	}
	with Event
		drawX = -1000
}


function CrashingNavigate(){
	with CrashingRocksEvent
		goBetween = true
	if argument0{
		CrashingRocksEvent.result = "Successful Passage!"
		CrashingRocksEvent.description = "The crew expertly navigate the rocky passage, and time their run perfectly to avoid the crash!"
		CrashingRocksEvent.sailing = true
		CrashingRocksEvent.success = true
		instance_destroy(CrashingRocks)
	}
	else{
		CrashingRocksEvent.result = "smashed by rocks!"
		CrashingRocksEvent.description = "The crew's best efforts were not enough, and the rocks crash into the ship!"
		CrashingRocksEvent.sailing = true
		CrashingRocksEvent.success = false
	}
	with Event
		drawX = -1000
}
