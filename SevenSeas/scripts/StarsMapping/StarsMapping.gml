function StarsMapping(argument0) {
	//Learn

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
    
	    buttonNumber = 2
	    ds_list_add(buttons, StarsMappingAllow)    
	    global.allowSelect = false

	    eventText = "'I'd like to map the stars! Can I have some equipment and time to draw diagrams?'"
	    global.moraleBoost = "map stars"
	    }

}
