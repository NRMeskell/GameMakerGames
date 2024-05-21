function JohnnyAllow() {
	ds_list_add(global.notificationList, "Johnny be excited!", "he runs aboard the ship and below decks.")

	with Pirate
	    {
	    UpdateMorale(-1, global.FEARSOME)
	    UpdateMorale(1, global.JOLLY)
	    } 
    
	JohnnyShortsticks.myState = "on ship"

	script_execute(closeEventCode)
}
