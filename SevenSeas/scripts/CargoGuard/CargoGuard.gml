function CargoGuard() {
	// safely play

	if argument0{
	    ds_list_add(global.notificationList, "The guards arrive!")
		ds_list_add(global.notificationList, "the guards intervene, stopping and arresting the thieves. They are grateful for your assistance in this arrest!")
		with Pirate
			UpdateMorale(1, global.KEEN)
	    }
	else{
		with Pirate
			UpdateMorale(-1, global.KEEN)
	    stolenItems = LoseRandomCargo(irandom_range(1,2*global.seaLevel))
	    ds_list_add(global.notificationList, "got away!", "The guards did not arrive, and the thieves got away with:#" + stolenItems)
		}

	script_execute(closeEventCode)
}
