function MastDamaged() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, MastDamagedSend, MastDamagedManeuver)
	    ds_list_add(buttonStats, 3, 5)
	    ds_list_add(buttonRequires, global.eventDiff[3,2], global.eventDiff[5,1])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "hold fast!", "send crew to sails!", "turn the ship out of the wind!")
        
	    global.allowSelect = false
	    captionText = "Heavy wind gust!"
	    eventText = "The ship will suffer damage if the sails not raised!"   
	    global.moraleBoost = "mast"
	    }






}
