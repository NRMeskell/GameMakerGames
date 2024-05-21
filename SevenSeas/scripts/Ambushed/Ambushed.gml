function Ambushed() {
	//Ambushed
	
	with instance_create(0,0,Event)
		{
		buttonNumber = 2
		ds_list_add(buttons, AmbushedFight, AmbushedRun)
		ds_list_add(buttonStats, 0, 3)
		ds_list_add(buttonRequires, 0, global.eventDiff[3, 2])
		ds_list_add(buttonCosts, 0, 0)
		ds_list_add(buttonText, "Prepare for battle!", "Run Away!")
        
		global.allowSelect = false
		captionText = "Ambush!"
    
		eventText = "An enemy is upon us!"   
		global.moraleBoost = "ambush"
	}
}
