function RottenPlanks() {
	//Ambushed

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, RottenIgnore, RottenReplace, RottenJuryRig)
	    ds_list_add(buttonStats, 0, 3, 3)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[3,1])
	    ds_list_add(buttonCosts, 0, global.seaLevel + 2, 0)
	    ds_list_add(buttonText, "ignore the problem", "replace the planks", "jury-rig a solution")
        
	    global.allowSelect = false
	    global.moraleBoost = "rotting"
	    captionText = "Rotten Planks!"
	    eventText = "several deck-planks are old and rotting, and might need replacement."  
	    }






}
