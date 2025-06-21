/// @description Rested Crew
function RestingCrew() {
	global.moraleBoost = "rested"
	with Pirate
	    {
		UpdateMorale(2, -1)
		UpdateHealth(id, round((maxHealth*1/2)))
	    }
    
	boards = 0
	while HasStored(3,1) and (Ship.myHealth < Ship.maxHealth)
	    {
	    UpdateHealth(Ship, (Ship.maxHealth div 10))
	    boards += 1
	    LoseCargo(3,1)
	    }
	
	ds_list_add(global.notificationList, "crew rested!", "the crew recovered health and morale!" + string_repeat("##" + string(boards) + " board(s) were used to repair the ship.", sign(boards)))
}

