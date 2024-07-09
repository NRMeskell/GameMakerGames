function LessNoise(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    buttonNumber = 2
	    ds_list_add(buttons, NoiseAllow)
     
	    global.allowSelect = false
	    eventText = "'The cabin is so noisy I can't even think. Can I ask the others to quiet down?'"
	    global.moraleBoost = "quiet"
	    }






}
