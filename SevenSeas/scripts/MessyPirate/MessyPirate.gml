function MessyPirate(argument0) {
	with instance_create(0,0,Request)
	    {
	    myPirate = argument0    
		otherPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		while otherPirate.id == myPirate.id
			otherPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
			
	    buttonNumber = 2
	    ds_list_add(buttons, MessyAllow)
     
	    global.allowSelect = false
	    eventText = otherPirate.name + " is very messy. Can they please clean their living space?"
    
	    global.moraleBoost = "messy"
	    }
}
