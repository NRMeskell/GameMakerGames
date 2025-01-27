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
