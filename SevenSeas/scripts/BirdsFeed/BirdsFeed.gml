function BirdsFeed() {
	
	//Birds stay
	ds_list_add(global.notificationList, "The bird were satisfied!", "they happily ate the food before flying away!")
	
	AddReputation("nature", 1, "bird feeding")
	UpdateMorale(1, global.DARING)
	UpdateMorale(2, global.KEEN)
	EventDrawer.floatAway = true
	script_execute(closeEventCode)

}