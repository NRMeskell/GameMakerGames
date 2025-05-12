// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BackflipRequest(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
		otherPirate = RandomPirate()
	    while otherPirate == myPirate and instance_number(Pirate) > 1
	        otherPirate = RandomPirate()
			
	    buttonNumber = 2
	    ds_list_add(buttons, BackflipAllow) 
	    global.allowSelect = false
	    eventText = "Can I teach " + otherPirate.name + " to do a back-flip? It would be so cool!"
    
	    global.moraleBoost = "back-flip"
	    }
}

/// @description clean up the mess
function BackflipAllow() {

	if irandom(1){
		if irandom(1){
			ds_list_add(global.notificationList, myPirate.firstName + " and " + otherPirate.firstName + " excited!", "They practice back-flips for the duration of the day, and " + otherPirate.firstName + " almost lands one!")
			with otherPirate
				UpdateMorale(1, -1)
		}
		else{
			ds_list_add(global.notificationList, myPirate.firstName + " and " + otherPirate.firstName + " thrilled!", "They practice back-flips, and " + otherPirate.firstName + " quickly learns the trick!")
			
			with otherPirate
				UpdateMorale(2, -1)
		}
	}
	else{
		ds_list_add(global.notificationList, otherPirate.firstName + " hurt!", otherPirate.firstName + " misses a flip and falls hard on their head.")
		with otherPirate
			myHealth = myHealth - myHealth div 5
	}
	
	with myPirate
		UpdateMorale(1, -1)
}