function TradingPostRest() {
	//rest
	with Pirate
	    {
	    myHealth = maxHealth
	    global.moraleBoost = "rest"
	    UpdateMorale(1, -1)
	    }
    
	var boards = RepairWithBoards()
	ds_list_add(global.notificationList, "A good night's sleep!", "The crew is well rested!" + string_repeat("##" + string(boards) + " board(s) were used to repair the ship.", sign(boards)))
	
	script_execute(closeEventCode, 2)
}

function TradingPostResting() {
	Wait(1/4*Clock.fullDay, TradingPostRest, argument0)
}
