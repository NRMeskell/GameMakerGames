function FruitBaskets() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, FruitLeave, FruitEat, FruitExamine) 
	    ds_list_add(buttonStats, 0, 0, 6)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[6, 1])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "leave the fruit alone", "eat the fruit", "examine the fruit")
        
	    global.allowSelect = false
	    captionText = "Jungle Fruit Baskets!"
	    eventText = "giant baskets of fruit line the port, and locals are happily helping themselves"
	    global.moraleBoost = "fruit"
	    }





}
