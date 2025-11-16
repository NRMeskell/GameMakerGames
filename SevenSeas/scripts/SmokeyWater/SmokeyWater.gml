function SmokeyWater() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, ThickFogWait, SmokeSail)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "wait out below decks", "continue to sail")
        
	    global.allowSelect = false
	    captionText = "Smoke and Ash!"
    
	    eventText = "The ship becomes blanketed in a smokey cloud, and the crew begin to cough" 
	    global.moraleBoost = "smoke"  
	    }
		
	repeat(10)
		with instance_create(0,0,FogEvent){
			image_blend = choose(merge_color(c_orange, c_ltgray, 0.5), c_white, c_ltgray, merge_color(c_maroon, c_ltgray, 0.5), c_gray)
		}
}


function SmokeSail() {
	if argument0{
		ds_list_add(global.notificationList, "safe sailing!", "The ship emerges from the cloud, and the crew breath a sigh of relief.")
	}
	else{
		ds_list_add(global.notificationList, "poison cloud!", "the smoke and ash make it difficult to breathe, causing hurting the crew's lungs!")
		with Pirate
			UpdateHealth(id, -25)
		with instance_create(0,0,ConditionTimer){
		    condition = SmokeTimer
		}
	}
	closeEventCode()
}

function SmokeTimer(){
	ds_list_add(global.notificationList, "damaged lungs!", "the crew continue to cough up smoke and ash!")
	with Pirate{
		UpdateHealth(id, -15)
		UpdateMorale(-1, -1)
	}
	if irandom(2) == 0 with instance_create(0,0,ConditionTimer){
		condition = SmokeTimer
	}
}

