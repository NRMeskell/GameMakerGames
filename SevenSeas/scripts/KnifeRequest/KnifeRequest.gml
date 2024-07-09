function KnifeRequest(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
			
	    buttonNumber = 2
	    ds_list_add(buttons, RaceAllow) 
	    global.allowSelect = false
		activity = choose("juggling", "throwing", "spinning")
	    eventText = "'the crew found me " + activity + " knives, and said it's too dangerous! I promise it's not, Can I keep " + activity + "?'"  
    
	    global.moraleBoost = "knives"
	    }






}
