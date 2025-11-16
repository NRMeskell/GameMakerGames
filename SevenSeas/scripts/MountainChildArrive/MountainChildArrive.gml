function MountainChildArrive() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 19
	    buttonNumber = 2
	    ds_list_add(buttons, closeEventCode, MountainChildGreet) 
	    ds_list_add(buttonStats, 0, 0, 5) 
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "leave the man alone", "greet the quiet man")
        
	    global.allowSelect = false
	    captionText = "Child of the Mountain"
	    if ChildOfTheMountain.myState == "unmet"
	        eventText = "A lone meditating man drifts by the ship. He seems oddly at peace in the harsh sea." 
	    else
	        eventText = "The lone man drifts by again, eyes fully closed in his small raft."
        
	    instance_create(0,0,RaftEvent)
	    global.moraleBoost = "mountain child"
		
		ChildOfTheMountain.myState = "calm"
	}
}

function MountainChildGreet(){
	if !argument0
		ds_list_add(global.notificationList, "Ignored!", "The man does not appear to notice, and continues to dift by the ship.")
	else{
		var choice = irandom(1)
		if choice == 0{
			ds_list_add(global.notificationList, "Given Directions!", "The man returns the greeting. He notices your foreign ship, and marks the nearest port on a map.")
		
			var landingList = ds_list_create()
			with LandingSpot if (portType == 1 and sprite_index == UnknownStopSpr){
				ds_list_add(landingList, id)
			}
		
			if ds_list_size(landingList) > 0
				with ds_list_find_value(landingList, 0)
					sprite_index = StopSpr
		}
		else if choice == 1{
			ds_list_add(global.notificationList, "Given gifts!", "The man returns the greeting. He warns of the volcanos danger, and gifts the crew an item for their journey.")
			GetRandomLoot(2, "GIFTS", [6, 9, 3])

			with StoreObjectParent
			    selected = false
			with Store
			    allowManySelects = false
		}
		else{
		}
	}
}

function MountainChildAnnoyed() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 20
	    buttonNumber = 2
	    ds_list_add(buttons, MountainChildAdmit, MountainChildFake) 
	    ds_list_add(buttonStats, 0, 0, 5) 
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "admit your crew attacked", "claim ignorance of the event")
        
	    global.allowSelect = false
	    captionText = "Child of the Mountain"
	    eventText = "The man, usually calm, has anger in his eyes. He asks if you know about the dissapearance of a trade ship."
        
	    instance_create(0,0,RaftEvent)
	    global.moraleBoost = "mountain child"
	}
}

function MountainChildAdmit(){
	ds_list_add(global.notificationList, "Emberstones burst!", "The man declares that you don't deserve the mountain's heart, and on board emberstones ignite!")
	
	var emstones = CargoAmount(9)
	UpdateHealth(Ship, -30*emstones)
	LoseCargo(9, emstones)
	ChildOfTheMountain.myState = "calm"
}

function MountainChildAdmit(){
	if argument0{
		ds_list_add(global.notificationList, "Man Convinced!", "The Child of the Mountain's anger is still present, but he let's you sail past.")
	
	}
	else{
		ds_list_add(global.notificationList, "Volcanic Rage!", "The man rages at your attack and deception! Emberstones on board shatter and the volcano starts to rumble!")
		
		var emstones = CargoAmount(9)
		UpdateHealth(Ship, -30*emstones)
		LoseCargo(9, emstones)
		
		with instance_create(0,0,ConditionTimer){
			condition = EncounterCharacter
			myArgument = Volcano
			timer = 1
		}
		
		EventDrawer.floatAway = true
	}
}
