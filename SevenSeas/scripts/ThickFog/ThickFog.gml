function ThickFogArrive() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, ThickFogWait, ThickFogSail)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "wait out the fog", "continue to sail")
        
	    global.allowSelect = false
	    captionText = "Thick Fog!"
    
	    eventText = "The ship becomes blanketed in a thick cloud, and it's difficult to see any potential dangers ahead." 
	    global.moraleBoost = "fog"  
	    }
		
	repeat(10)
		instance_create(0,0,FogEvent)
}

function ThickFogWait() {
	Wait(1/8*Clock.fullDay, ThickFogWaited, argument0)
}

function ThickFogWaited(){
	ds_list_add(global.notificationList, "fog dissipates!", "After a while, the fog clears and the danger passes.")
}

function ThickFogSail() {
	if argument0{
		ds_list_add(global.notificationList, "safe sailing!", "The ship emerges from the cloud, and the crew breath a sigh of relief.")
	}
	else{
		ds_list_add(global.notificationList, "rocks hit!", "the ship crashes into several unseen rocks before emerging from the fog.")
		with Ship
			UpdateHealth(Ship, -50)
	}
}

