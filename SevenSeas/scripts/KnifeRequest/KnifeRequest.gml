function KnifeRequest(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
		otherPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    while otherPirate == myPirate and instance_number(Pirate) > 1
	        otherPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
			
	    buttonNumber = 2
	    ds_list_add(buttons, KnifeGamesAllow) 
	    global.allowSelect = false
		activity = choose("throwing", "spinning", "twirling")
	    eventText = "'" + otherPirate.name + " found me " + activity + " knives, and told me to stop! Can I keep " + activity+ "?'"  
    
	    global.moraleBoost = "knives"
	    }

}
