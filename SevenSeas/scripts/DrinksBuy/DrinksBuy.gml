function DrinksBuy() {
	//Dont let play
	with Pirate{
	    UpdateMorale(1,-1)
	    UpdateMorale(1, global.JOLLY)
	    }
    
	ds_list_add(global.notificationList, "good refreshments!", "the crew gains morale!")

	script_execute(closeEventCode)
}
