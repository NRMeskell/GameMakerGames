function SpearFishing(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
    
	    buttonNumber = 2
	    ds_list_add(buttons, FishingAllow) 
	    global.allowSelect = false
	    eventText = "'The ocean is full of plenty of fish, and my aim is perfect! Can I try my hand at spear fishing?'"  
    
	    global.moraleBoost = "fishing"
	    }






}
