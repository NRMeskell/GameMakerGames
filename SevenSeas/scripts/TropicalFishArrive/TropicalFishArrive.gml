function TropicalFishArrive() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, FishIgnore, FishCatch, FishWatch)
	    ds_list_add(buttonStats, 0, 3, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2], global.eventDiff[6, 0])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "ignore them", "go fishing", "inspect the fish")
        
	    global.allowSelect = false
	    captionText = "colorful fish!"
	    eventText = "a swarm of colorful fish is swimming near the ship!"  
	    global.moraleBoost = "fish" 
	    }

	repeat(irandom_range(20, 30))
	    instance_create(0,0,FishEvent)






}
