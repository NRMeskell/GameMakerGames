function FlagAllow() {
	if irandom(2) > 0
	    {
	    ds_list_add(global.notificationList, "Horrible design!", "the flag is awful and the crew rejects the new design.")
    
	    with myPirate
	        UpdateMorale(-1, -1)
	    with Pirate
	        UpdateMorale(-1, global.KEEN)
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Amazing design!", "the new flag is well-made and the crew gladly fly under the new design!")
    
	    with Pirate
	        {
	        UpdateMorale(1, -1)
	        UpdateMorale(1, global.KEEN)
	        }
	    }
}
