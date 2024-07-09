function RaceUpMast(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
    
	    buttonNumber = 2
	    ds_list_add(buttons, RaceAllow) 
	    global.allowSelect = false
	    eventText = "'I'd like a little excitement. Can I see how fast I can climb up the mast?'"  
    
	    global.moraleBoost = "race"
	    }






}
