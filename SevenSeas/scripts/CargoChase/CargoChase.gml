function CargoChase() {
	if argument0{
		with Pirate
			UpdateMorale(1, global.DARING)
		ds_list_add(global.notificationList, "Chased away!", "The thieves were run off, and all cargo was safely secured back on board")
	}
	else{
		stolenItems = LoseRandomCargo(irandom_range(1,2*global.cargoAmount))
		UpdateMorale(-1, global.FEARSOME)
		UpdateMorale(-1, global.KEEN)
		ds_list_add(global.notificationList, "Confused chase!", "The thieves ran a clever distraction, and got away with cargo:#" + stolenItems)
	}
	
	script_execute(closeEventCode)
}