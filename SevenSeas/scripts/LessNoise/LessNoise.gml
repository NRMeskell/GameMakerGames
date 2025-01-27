function LessNoise(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    buttonNumber = 2
	    ds_list_add(buttons, NoiseAllow)
     
	    global.allowSelect = false
	    eventText = "The crew is so noisy, and they are always in my way! Can I ask the others to quiet down?"
	    global.moraleBoost = "quiet"
	    }






}
