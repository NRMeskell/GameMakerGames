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
	    eventText = "Look how wonderful the water looks! Can I go for a quick swim?"  
    
	    global.moraleBoost = "swimming"
	    }
}

function SwimmingAllow(){
	if sign(irandom(3)) {
		ds_list_add(global.notificationList, myPirate.firstName + " had a nice swim!", "The water was very refreshing, and they enjoyed the break!")
		with myPirate 
			UpdateMorale(1, -1)
	}
	else if irandom(1) {
		Ship.myHealth -= 20+15*global.seaLevel
		ds_list_add(global.notificationList, "crunching stop!", myPirate.firstName + " knocked the anchor overboard while getting in the water!")
	}
}