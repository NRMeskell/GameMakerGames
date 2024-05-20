function SpoiledFoodSalvage(argument0) {
	//Salvage Food


	global.foodQuality = ((CargoAmount(4) - argument0)*global.foodQuality + (argument0*-1))/CargoAmount(4)
	ds_list_add(global.notificationList, "Food mixed!", "good and spoiled food be mixed together, lowering food quality!")

	script_execute(closeEventCode, 2)






}
