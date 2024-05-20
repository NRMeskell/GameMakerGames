/// @description Agree cheats
function ImproveAllow() {

	if irandom(2) == 0
	    {
	    newHealth = (Ship.myHealth * 0.1) div 1
	    Ship.myHealth += newHealth
	    if Ship.myHealth > Ship.maxHealth
	        Ship.maxHealth = Ship.myHealth
	    ds_list_add(global.notificationList, "ship improved!", "the ships hull was successfully strengthened!")
	    }
	else
	    {
	    newHealth = (Ship.myHealth * 0.1) div 1
	    Ship.myHealth = (Ship.myHealth*0.9) div 1
	    ds_list_add(global.notificationList, "ship damaged!", "in the process of improvement, the ships hull was damaged.")
	    }



}
