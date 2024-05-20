function CargoGuard() {
	// safely play

	if argument0{
	    ds_list_add(global.notificationList, "The gaurds arrive!")
		var coveLawRep = searchReputationType("patrol")
	    if coveLawRep[0] < -3{
			stolenItems = LoseRandomCargo(irandom_range(1,2*global.seaLevel))
			ds_list_add(global.notificationList, "Upon recognising your crew from the " + coveLawRep[1] + ", the gaurds refuse to help! Cargo stolen:#" + stolenItems)
			with Pirate
				UpdateMorale(-1, global.KEEN)
			}
		else{
			ds_list_add(global.notificationList, "the gaurds intervene, stopping and arresting the thieves. They are grateful for your assistance in this arrest!")
			AddReputation("patrol", 1, "theif arrest")
			with Pirate
				UpdateMorale(1, global.KEEN)
			}
	    }
	else{
		with Pirate
			UpdateMorale(-1, global.KEEN)
	    stolenItems = LoseRandomCargo(irandom_range(1,2*global.seaLevel))
	    ds_list_add(global.notificationList, "got away!", "The gaurds did not arrive, and the theives got away with:#" + stolenItems)
	    AddReputation("fear", -1, "escaped theives")
		}

	script_execute(closeEventCode)
}
