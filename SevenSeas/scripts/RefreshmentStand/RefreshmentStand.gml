function RefreshmentStand() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, DrinksIgnore, DrinksBuy, DrinksFree)
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, instance_number(Pirate), 0)
	    ds_list_add(buttonText, "ignore it", "buy the crew drinks", "get free drinks")
        
	    global.allowSelect = false
	    captionText = "Refreshment Stand"
	    eventText = "A refreshment stand is open on the docks."  
	    global.moraleBoost = "stand" 
	    }





}
