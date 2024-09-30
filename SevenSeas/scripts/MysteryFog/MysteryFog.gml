function MysteryFogArrive() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, ThickFogWait, MysteryFogSail)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "wait out below decks", "continue to sail")
        
	    global.allowSelect = false
	    captionText = "Mysterious Fog!"
    
	    eventText = "The ship becomes blanketed in an unnatural purple fog..." 
	    global.moraleBoost = "purple fog"  
	    }
		
	repeat(10)
		with instance_create(0,0,FogEvent){
			image_blend = choose(c_purple, c_white, c_ltgray, merge_color(c_fuchsia, c_ltgray, 0.5), c_gray)
		}
}


function MysteryFogSail() {
	if argument0{
		ds_list_add(global.notificationList, "safe sailing!", "The ship emerges from the cloud, and the crew breath a sigh of relief.")
	}
	else{
		ds_list_add(global.notificationList, "poison cloud!", "the mysterious cloud enters the crew's lungs, making it difficult to breathe!")
		with Pirate
			myHealth -= irandom(10) + 15
		with instance_create(0,0,ConditionTimer){
		    condition = MysteryFogPoison
		}
	}
	closeEventCode()
}

function MysteryFogPoison(){
	ds_list_add(global.notificationList, "poisoned lungs!", "the crew continue to cough up purple smoke!")
	with Pirate{
		myHealth -= irandom(10) + 5
		UpdateMorale(-1, -1)
	}
	if irandom(1) == 0 with instance_create(0,0,ConditionTimer){
		condition = MysteryFogPoison
	}
}

