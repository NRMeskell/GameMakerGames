function SeaSickPirates() {
	with instance_create(0, 0, Event)
	    {
	    pirateOverboard = instance_find(Pirate, irandom(instance_number(Pirate) - 1))
    
	    buttonNumber = 3
	    ds_list_add(buttons, SeaSickHold, SeaSickRest, SeaSickMedicine)
	    ds_list_add(buttonStats, 0, 0, 6)
	    ds_list_add(buttonRequires, 0, 0,  global.eventDiff[6,2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "hold fast!", "let crew rest!", "Treat the sickness!")
        
	    global.allowSelect = false
	    captionText = "Crew getting seasick!"
	    eventText = "some pirates are very ill and need help!"   
	    global.moraleBoost = "seasick"
	    }




}
