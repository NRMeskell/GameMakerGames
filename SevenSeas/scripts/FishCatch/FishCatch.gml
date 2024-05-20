function FishCatch() {
	AddReputation("nature", -1, "catching fish")
	//Stop Birds
	if argument0{
		GetRandomLoot(irandom(2)+1, "fish caught", [4,6])
	}
	else{
		ds_list_add(global.notificationList, "None caught!", "The fish were too quick, and they got away!")
		UpdateMorale(-1, global.KEEN)
	}

	EventDrawer.floatAway = true
	script_execute(closeEventCode)
}
