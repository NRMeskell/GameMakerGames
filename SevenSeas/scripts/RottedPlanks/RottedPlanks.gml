function RottedPlanks() {
	//rotten planks

	UpdateHealth(Ship, -Ship.myHealth div 8)
	ds_list_add(global.notificationList, "Planks Rotted!", "Several planks gave out and the ship was damaged!")

	instance_destroy()



}
