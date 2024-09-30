function StrangeAnimal() {
	//Merchant Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, StrangeOpen, StrangeThrow, StrangeTrap) 
	    ds_list_add(buttonStats, 0, 0, 6) 
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[6, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "open container lid", "throw it overboard", "set traps all around")
        
	    global.allowSelect = false
	    captionText = "Strange Noises!"
	    eventText = "Strange scuffling sounds are coming from inside a storage container!"
	    global.moraleBoost = "animal"
		
		audio_play_sound(ScratchingSnd, 0, true)
	    }






}
