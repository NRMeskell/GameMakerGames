function CookLearn(argument0) {
	//Cook

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    buttonNumber = 2
	    ds_list_add(buttons, CookAllow)
     
	    global.allowSelect = false
	    eventText = "I've been thinking about a new recipe, and I'd like to try it! Can I use some food?"
	    global.moraleBoost = "cooking"
	    }




}
