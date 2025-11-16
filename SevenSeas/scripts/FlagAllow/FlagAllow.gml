function FlagAllow() {
	if irandom(2) > 0
	    {
	    ds_list_add(global.notificationList, "Horrible design!", "The crew can't find anything anymore, and everyone's grumpy.")
    
	    with myPirate
	        UpdateMorale(-1, -1)
	    with Pirate
	        UpdateMorale(-1, global.KEEN)
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Amazing design!", "The deck is much cleaner, and some forgotten cargo is found!")
    
	    GetRandomLoot(1, "CARGO", [0, 0, 0, 1, 2, 3, 4, 4, 5, 6])
	    }
}
