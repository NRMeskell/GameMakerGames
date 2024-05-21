function BirdsScareAway() {
	//Stop Birds

	with Pirate
	    {
	    UpdateMorale(-1, -1)
	    UpdateMorale(1, global.DARING)
	    }
        
	if argument0{
		ds_list_add(global.notificationList, "The birds were scared away!", "The crew be annoyed, but the birds were chased away before anything was taken!")
	}
	else{
		itemsTaken = ""
		repeat(irandom(global.seaLevel div 2) + 1) {
		    if irandom(1)
		        itemsTaken += LoseRandomItems(1) + "#"
		    else
		        itemsTaken += LoseRandomCargo(3) + "#"
		    }

		ds_list_add(global.notificationList, "Failed to scare off the birds!", "They made away with cargo:#" + itemsTaken)
	}

	EventDrawer.floatAway = true
	script_execute(closeEventCode)
}
