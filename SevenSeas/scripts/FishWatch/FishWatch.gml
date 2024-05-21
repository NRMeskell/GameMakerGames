function FishWatch() {
	//Try to catch a bird

	if argument0{
		with Pirate
		    {
		    UpdateMorale(1, global.KEEN)
			UpdateMorale(1, -1)
		    }
    
		ds_list_add(global.notificationList, "interesting fish!", "The crew carefully watches the fish, and they seem to like the attention.")
	}else{
		ds_list_add(global.notificationList, "fish disappear!", "The fish are unhappy with the sudden attention, and swim away quickly.")
	}
	
	EventDrawer.floatAway = true
	script_execute(closeEventCode)



}
