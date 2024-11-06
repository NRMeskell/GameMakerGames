function BirdsCatch() {
	//Try to catch a bird

	result = irandom(10)

	if !argument0
	    {
		itemsTaken = ""
		repeat(irandom(global.seaLevel div 2) + 1) {
		    if irandom(3) == 0
		        itemsTaken += LoseRandomItems(1) + "#"
		    else
		        itemsTaken += LoseRandomCargo(2) + "#"
		    }

		ds_list_add(global.notificationList, "Failed to scare off the birds!", "They made away with cargo:#" + itemsTaken)
	}
	else
		{
		global.moraleBoost = "parrot"
		with Pirate
		    {
		    UpdateMorale(1,global.DARING)
		    }
		ds_list_add(ItemRunner.floatingItems, MakeRandomPetItem(0))
		ds_list_add(global.notificationList, "A parrot was caught!", "This colorful bird is now a part of the crew.")
		}
    
	EventDrawer.floatAway = true
	script_execute(closeEventCode)
}
