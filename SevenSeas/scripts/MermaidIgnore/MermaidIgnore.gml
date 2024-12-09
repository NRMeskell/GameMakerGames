function MermaidIgnore() {
	//Trading Post Trade

	if !argument0
	    {
	    struckPirate = RandomPirate()
	    ds_list_add(global.notificationList, "siren's song!", struckPirate.name + " loved the song, and injured themselves trying to get overboard!")
		struckPirate.myHealth -= 20
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
