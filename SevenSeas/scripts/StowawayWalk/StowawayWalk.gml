function StowawayWalk() {
	with Pirate
	    {
	    UpdateMorale(2,  global.FEARSOME)
	    UpdateMorale(1,  global.DARING)
	    UpdateMorale(1,  global.KEEN)
	    }
    
	ds_list_add(global.notificationList, "stowaway walks plank!", "the more fearsome crew members gain morale!")
	AddReputation("repute", -1, "stowaway execution")
	AddReputation("fear", 1, "stowaway execution")
	script_execute(closeEventCode)






}
