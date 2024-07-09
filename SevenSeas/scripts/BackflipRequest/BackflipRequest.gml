function BackflipRequest(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
		otherPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    while otherPirate == myPirate and instance_number(Pirate) > 1
	        otherPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
			
	    buttonNumber = 2
	    ds_list_add(buttons, BackflipAllow) 
	    global.allowSelect = false
	    eventText = "'Can I teach " + otherPirate.name + " to do a backflip? It would be so cool!'"
    
	    global.moraleBoost = "backflip"
	    }






}
