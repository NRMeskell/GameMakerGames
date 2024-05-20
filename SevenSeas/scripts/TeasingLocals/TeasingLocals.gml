function TeasingLocals() {
	global.moraleBoost = "mocking"

	with Pirate
	    {
	    UpdateMorale(-1, global.KEEN)
	    UpdateMorale(-1, global.DARING)
	    }
		
	AddReputation("repute", -1, "mockings")

	ds_list_add(global.notificationList, "Rude locals!", "several locals tease and mock your crew, lowering morale")




}
