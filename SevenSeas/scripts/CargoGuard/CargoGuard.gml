function CargoGuard() {
	// safely play

	if argument0{
	    ds_list_add(global.notificationList, "The gaurds arrive!")
		ds_list_add(global.notificationList, "the gaurds intervene, stopping and arresting the thieves. They are grateful for your assistance in this arrest!")
		with Pirate
			UpdateMorale(1, global.KEEN)
	    }
	else{
		with Pirate
			UpdateMorale(-1, global.KEEN)
	    stolenItems = LoseRandomCargo(irandom_range(1,2*global.seaLevel))
	    ds_list_add(global.notificationList, "got away!", "The gaurds did not arrive, and the theives got away with:#" + stolenItems)
		}

	script_execute(closeEventCode)
}
