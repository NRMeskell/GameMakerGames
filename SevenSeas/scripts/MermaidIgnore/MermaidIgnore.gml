function MermaidIgnore() {
	//Trading Post Trade

	if irandom(3) == 0
	    {
	    struckPirate = instance_find(Pirate,irandom(instance_number(Pirate)-1))
	    if irandom(2) > 0
	        {
	        if !struckPirate.injured
	            struckPirate.myHealth = 0
	        else
	            struckPirate.myHealth -= 20
	        ds_list_add(global.notificationList, "siren's song!", struckPirate.name + " loved the song, and injured themselves trying to get overboard!")
	        }
	    else
	        {
	        with struckPirate
	            {
	            injured = true
	            myHealth = 0
	            }
	        ds_list_add(global.notificationList, "siren's song!", struckPirate.name + " loved the song, and jumped overboard!")
	        }
	    }
	else
	    {
	    ds_list_add(global.notificationList, "crew dissapointed!", "the crew wanted to see the mermaids, and lost morale!")
	    with Pirate
	        {
	        UpdateMorale(-1, -1)
	        UpdateMorale(-1, global.KEEN)
	        }
	    }
   
	with EventDrawer
	    floatAway = true
	script_execute(closeEventCode, 2)







}
