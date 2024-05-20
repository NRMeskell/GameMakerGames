function SpoiledFoodSave(argument0) {
	//Save Food

	if argument0{
		LoseCargo(4, argument0 div 4)
		ds_list_add(global.notificationList, "spoiled food discarded!", "the barrel contents were mostly saved, with little waste.")
	}
	else{
		LoseCargo(4, argument0)
		global.foodQuality = ((CargoAmount(4) - (argument0 div 2))*global.foodQuality)/CargoAmount(4)
		ds_list_add(global.notificationList, "food not saved!", "spoiled food was saved and good food thrown out, lowering food quality and saving none of the barrel contents.")		
	}
	
	script_execute(closeEventCode, 2)
}
