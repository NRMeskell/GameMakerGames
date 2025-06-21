function RottenPlanks() {
	//Ambushed

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, RottenJuryRig, RottenReplace)
	    ds_list_add(buttonStats, 3, 3)
	    ds_list_add(buttonRequires, global.eventDiff[3,1], 0)
	    ds_list_add(buttonCosts, 0, global.seaLevel + 1)
	    ds_list_add(buttonText, "jury-rig a solution", "replace the planks")
        
	    global.allowSelect = false
	    global.moraleBoost = "rotting"
	    captionText = "Rotten Planks!"
	    eventText = "several deck-planks are old and rotting, and might need replacement."  
	    }






}
