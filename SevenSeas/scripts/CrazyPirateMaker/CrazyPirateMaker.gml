function CrazyPirateMaker() {
	//Spoiled food

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 2
	    ds_list_add(buttons, CrazyPirateLetBe, CrazyPirateMorale, CrazyPirateMedicate) 
	    ds_list_add(buttonStats, 0, 5, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[5,2], global.eventDiff[6, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "ignore the problem", "Raise crew morale", "provide medicine for sickness")
        
	    global.allowSelect = false
	    captionText = "Fatigued crew!"
    
	    eventText = "Morale be low, and the crew be going stir-crazy on the ship."
	    global.moraleBoost = "fatigue"
	    }
}
