function SeaSickPirates() {
	with instance_create(0, 0, Event)
	    {
	    sickPirate = RandomPirate()
    
	    buttonNumber = 3
	    ds_list_add(buttons, SeaSickHold, SeaSickMedicine)
	    ds_list_add(buttonStats, 0, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[6,2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "hold fast!", "Treat the sickness!")
        
	    global.allowSelect = false
	    captionText = sickPirate.firstName + " seasick!"
	    eventText = sickPirate.name + " is very ill and needs help!"   
	    global.moraleBoost = "seasick"
	    }




}
