function InstrumentLearn(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    buttonNumber = 2
	    ds_list_add(buttons, InstrumentAllow)
     
	    global.allowSelect = false
	    eventText = "'I've been teaching myself the " + choose("banjo", "accordian", "lute", "flute") + " and I'd like to perform for the crew! What do you say?'"
	    global.moraleBoost = "performance"
	    }
    





}
