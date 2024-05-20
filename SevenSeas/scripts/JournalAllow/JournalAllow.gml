function JournalAllow() {
	if irandom(1)
	    {
	    ds_list_add(global.notificationList, "Journal found!", "the journal was quickly found on the floor of the cabin.")
    
	    with myPirate
	        UpdateMorale(1,-1)
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Journal not found!", "the journal remains missing, and everyone is upset that " + myPirate.firstName + " moved their stuff.")
    
	    with Pirate
	        {
	        UpdateMorale(-1, -1)
	        }
	    }



}
