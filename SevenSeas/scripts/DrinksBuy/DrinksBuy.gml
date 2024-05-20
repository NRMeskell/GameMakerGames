function DrinksBuy() {
	//Dont let play
	with Pirate{
	    UpdateMorale(1,-1)
	    UpdateMorale(1, global.JOLLY)
	    }
    
	ds_list_add(global.notificationList, "good refreshments!", "the crew gains morale!")
	AddReputation("repute", 1, "bought drinks")

	script_execute(closeEventCode)
}
