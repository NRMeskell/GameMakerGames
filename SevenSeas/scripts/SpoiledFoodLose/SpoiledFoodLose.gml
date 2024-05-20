function SpoiledFoodLose(argument0) {
	//discard Food

	LoseCargo(4, argument0)

	ds_list_add(global.notificationList, "Food barrel discarded!", string(argument0) + " food be lost!")
	script_execute(closeEventCode, 2)







}
