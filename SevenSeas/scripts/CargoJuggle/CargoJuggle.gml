// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CargoJuggle(){
	//Swimming
	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
    
	    buttonNumber = 2
	    ds_list_add(buttons, JugglingAllow) 
	    global.allowSelect = false
	    eventText = "'There aren't any fun things to do around here. Can I try juggling some cargo?'"  
    
	    global.moraleBoost = "juggling"
	    }
}

function JugglingAllow(){
	if sign(irandom(3)) {
		ds_list_add(global.notificationList, "grand performance!", myPirate.firstName + " had great time juggling, and the crew enjoyed it too!")
		UpdateMorale(1, -1)
	}
	else if irandom(1) {
		cargoLost = LoseRandomCargo(2)
		ds_list_add(global.notificationList, "cargo overboard!", myPirate.firstName + " accidentally tossed the " + cargoLost + " they were juggling overboard!")
	}
}