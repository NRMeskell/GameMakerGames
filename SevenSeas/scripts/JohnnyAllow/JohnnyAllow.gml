function JohnnyAllow() {
	ds_list_add(global.notificationList, "Johnny be excited!", "the child runs aboard, trying to stay out of the way of the crew.")

	with Pirate
	    {
	    UpdateMorale(-1, global.FEARSOME)
	    UpdateMorale(1, global.JOLLY)
	    } 
    
	JohnnyShortsticks.myState = "on ship"

	script_execute(closeEventCode)
}
