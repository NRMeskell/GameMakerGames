/// @description clean up the mess
function RaceAllow() {

	if sign(irandom(2))
	    {
	    ds_list_add(global.notificationList, "impressive climb!", myPirate.firstName + " raced up the mast at an impressive speed, raising crew moral!")
	    with Pirate if id != other.myPirate.id
	        {
			if irandom(1)
				UpdateMorale(1, global.KEEN)
	        UpdateMorale(1, global.DARING)
			if irandom(1)
				UpdateMorale(1, global.JOLLY)
	        }
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Climbing accident!", myPirate.firstName + " fell off the mast, and injured themselves!")
	    with myPirate
	        myHealth -= maxHealth div 4
	    }



}
