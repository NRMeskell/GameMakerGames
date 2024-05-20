function DolphinsBefriend() {
	// safely play

	if argument0{
		ds_list_add(global.notificationList, "Dolphins befriended!", "the dolphins respond well to your attempts to communicate! They seem quite pleased before disappearing under water.")
		UpdateMorale(2, global.KEEN)
		AddReputation("nature", 2, "friendship with dolphin")
	}
	else{
		ds_list_add(global.notificationList, "Dolphins insulted!", "A clumbsy attempt to communicate seems to only insult the dolphins, which disappear below the water.")
		UpdateMorale(-1, global.KEEN)
		AddReputation("nature", -1, "dolphin insults")
	}

	instance_destroy(Dolphins)
	script_execute(closeEventCode)



}
