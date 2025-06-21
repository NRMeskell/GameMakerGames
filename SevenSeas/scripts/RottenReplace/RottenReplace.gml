function RottenReplace() {
	//Allow to stay messy

	ds_list_add(global.notificationList, "Planks Replaced!", "The ship is repaired, and looks better than before!")
	UpdateHealth(Ship, Ship.maxHealth*1.25 div 1)
	script_execute(closeEventCode, 2)

}
