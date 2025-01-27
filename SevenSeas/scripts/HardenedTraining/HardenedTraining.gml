function HardenedTraining(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0    
	    buttonNumber = 2
	    ds_list_add(buttons, TrainingAllow)
     
	    global.allowSelect = false
	    eventText = "The crew is horribly unfit for a real test! Can I start a mandatory training session?"
	    global.moraleBoost = "training"
	    }




}
