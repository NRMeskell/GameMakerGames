function JohnnyAllow() {
	ds_list_add(global.notificationList, "Johnny excited!", "the child runs aboard! He stays out of the way, but promises to let you know if anything happens.")

	with Pirate
	    {
	    UpdateMorale(-1, global.FEARSOME)
	    UpdateMorale(1, global.JOLLY)
	    } 
    
	JohnnyShortsticks.myState = "on ship"

	script_execute(closeEventCode)
}
