// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GoSwimming(){
	//Swimming
	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
    
	    buttonNumber = 2
	    ds_list_add(buttons, SwimmingAllow) 
	    global.allowSelect = false
	    eventText = "The water looks beautiful and relaxing! Can we all go for a quick swim?"  
    
	    global.moraleBoost = "swimming"
	    }
}

function SwimmingAllow(){
	if sign(irandom(3)) {
		ds_list_add(global.notificationList, "a nice swim!", "The water was very refreshing, and the crew enjoyed the break!")
		with myPirate 
			UpdateMorale(1, -1)
	}
	else {
		cargoString = LoseRandomCargo(irandom(global.seaLevel)+1)
		ds_list_add(global.notificationList, "cargo overboard!", myPirate.firstName + " knocked " + cargoString + " overboard while getting in the water!")
	}
}