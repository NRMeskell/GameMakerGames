function KnifeKitchen(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0    
	    buttonNumber = 2
	    ds_list_add(buttons, KnifeAllow)
     
	    global.allowSelect = false
	    eventText = "There's a lovely knife being wasted in the kitchens! Can I repurpose it for combat?"
	    global.moraleBoost = "knife"
	    }




}
