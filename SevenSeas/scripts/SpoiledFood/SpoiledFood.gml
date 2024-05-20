function SpoiledFood() {
	//Spoiled food

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    eventValue = max(1,irandom_range(CargoAmount(4)/8, CargoAmount(4)/4))
	    ds_list_add(buttons, SpoiledFoodLose, SpoiledFoodSalvage, SpoiledFoodSave)
	    ds_list_add(buttonStats, 0, 0, 6)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[6, 1])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "discard the food barrel", "mix into other barrels", "salvage spoiled food")
        
	    global.allowSelect = false
	    captionText = "Spoiled Food!"
    
	    eventText = "a barrel filled with " + string(eventValue) + " food has spoiled!"   
	    global.moraleBoost = "spoiling"
	    }






}
