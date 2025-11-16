function FlagDesign(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0    
	    buttonNumber = 2
	    ds_list_add(buttons, FlagAllow)
     
	    global.allowSelect = false
	    eventText = "Our ship's layout could be better! Can I reorganize the deckspace?"
	    global.moraleBoost = "Flag"
	    }
}
