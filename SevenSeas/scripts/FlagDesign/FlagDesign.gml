function FlagDesign(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0    
	    buttonNumber = 2
	    ds_list_add(buttons, FlagAllow)
     
	    global.allowSelect = false
	    eventText = "Our ship's flag could be better! Can I make us a more interesting design?"
	    global.moraleBoost = "Flag"
	    }
}
