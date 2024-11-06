function BirdsArrive() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, BirdsScareAway, BirdsEat, BirdsCatch)
	    ds_list_add(buttonStats, 0, 3, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1], global.eventDiff[3, 3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "chase them away", "kill them for food", "catch one as a pet")
        
	    global.allowSelect = false
	    captionText = "pesky birds!"
	    eventText = "a flock of birds are harassing the ship and stealing things!"  
	    global.moraleBoost = "birds" 
	    }

	repeat(irandom_range(3, 6))
	    instance_create(0,0,BirdEvent)
}
