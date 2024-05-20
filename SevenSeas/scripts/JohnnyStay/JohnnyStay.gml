function JohnnyStay() {
	ds_list_add(global.notificationList, "Johnny excited!", "he jumps, claps, and thanks you before running back below decks.")

	with Pirate
	    {
	    UpdateMorale(-2, global.FEARSOME)
	    UpdateMorale(1, global.JOLLY)
	    }

	JohnnyShortsticks.myState = "on ship"

	script_execute(closeEventCode)






}
