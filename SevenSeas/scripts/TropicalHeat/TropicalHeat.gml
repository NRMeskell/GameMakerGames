function TropicalHeat() {
	//Merchant Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, TropicalWork, TropicalRest, TropicalFood) 
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, 0, instance_number(Pirate) div 2)
	    ds_list_add(buttonText, "keep working", "take a break", "provide food and water")
        
	    global.allowSelect = false
	    captionText = "Blazing Heat!"
    
	    eventText = "The crew is exhausted, overheating, and tired!" 
	    global.moraleBoost = "heat"
	    }






}
