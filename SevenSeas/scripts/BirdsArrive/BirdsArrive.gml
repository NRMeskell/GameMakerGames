function BirdsArrive() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, BirdsFeed, BirdsScareAway, BirdsCatch)
	    ds_list_add(buttonStats, 4, 3, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 0], global.eventDiff[3, 3])
	    ds_list_add(buttonCosts, global.seaLevel+1, 0, 0)
	    ds_list_add(buttonText, "give them food", "chase them away", "catch one as a pet")
        
	    global.allowSelect = false
	    captionText = "pesky birds!"
	    eventText = "a flock of birds are harassing the ship and stealing things!"  
	    global.moraleBoost = "birds" 
	    }

	repeat(irandom_range(3, 6))
	    instance_create(0,0,BirdEvent)






}
