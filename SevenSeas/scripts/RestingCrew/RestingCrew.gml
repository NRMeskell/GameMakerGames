/// @description Rested Crew
function RestingCrew() {
	global.moraleBoost = "rested"
	with Pirate
	    {
		UpdateMorale(2, -1)
		UpdateHealth(id, round((maxHealth*1/2)))
	    }
    
	var boards = RepairWithBoards()
	
	ds_list_add(global.notificationList, "crew rested!", "the crew recovered health and morale!" + string_repeat("##" + string(boards) + " board(s) were used to repair the ship.", sign(boards)))
}

