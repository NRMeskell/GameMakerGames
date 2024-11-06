function BirdsEat() {
	//Try to catch a bird

	if !argument0
	    {
		itemsTaken = ""
		repeat(irandom(global.seaLevel div 2) + 1) {
		    if irandom(3) == 0
		        itemsTaken += LoseRandomItems(1) + "#"
		    else
		        itemsTaken += LoseRandomCargo(2) + "#"
		    }

		ds_list_add(global.notificationList, "Failed to kill any birds!", "They made away with cargo:#" + itemsTaken)
	}
	else
		{
		global.moraleBoost = "food"
		var birdsKilled = irandom_range(1,2)
		
		GetRandomLoot(birdsKilled, "Birds", [4,4,6])
		with Pirate
		    {
		    UpdateMorale(1,global.DARING)
		    }
		ds_list_add(global.notificationList, "birds killed!", "The large birds will make for several good meals!")
		}
    
	EventDrawer.floatAway = true
	script_execute(closeEventCode)
}
