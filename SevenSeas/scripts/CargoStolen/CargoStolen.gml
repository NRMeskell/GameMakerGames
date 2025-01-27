function CargoStolen() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, CargoChase, CargoCatch, CargoGuard)
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, global.eventDiff[5,1], global.eventDiff[5, 3], global.eventDiff[5, 1])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "Chase them off", "catch and discipline them", "summon the town guard")
        
	    global.allowSelect = false
	    captionText = "Dishonest Cargo-loaders!"
	    eventText = "A group of dockworkers are stealing cargo off the ship!" 
	    global.moraleBoost = "thieves"  
	    }
}
