function BugSquash(argument0) {
	with instance_create(0,0,Request)
	    {
	    myPirate = argument0   
	    otherPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    while otherPirate == myPirate and instance_number(Pirate) > 1
	        otherPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
         
	    buttonNumber = 2
	    ds_list_add(buttons, BugAllow)
     
	    global.allowSelect = false
	    eventText = "'" + otherPirate.name + " is scared of everything! Can I have them kill the big bug in our quarters to toughen up?'"
    
	    global.moraleBoost = "bug"
	    }




}
