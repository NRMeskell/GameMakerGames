function MastDamaged() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, MastDamagedHope, MastDamagedSend, MastDamagedManeuver)
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3,1], global.eventDiff[5,2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "hold fast!", "send crew to sails!", "maneuver to safety!")
        
	    global.allowSelect = false
	    captionText = "Heavy wind gust!"
	    eventText = "The ship will suffer damage if the sails not raised!"   
	    global.moraleBoost = "mast"
	    }






}
