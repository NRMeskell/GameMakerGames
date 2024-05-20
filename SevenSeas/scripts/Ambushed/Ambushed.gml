function Ambushed() {
	//Ambushed
	
	if searchReputationType("renown")[0] < round((1+global.seaLevel)*random_range(1,3)){
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
	else{
		with instance_create(0,0,Event)
		{
		buttonNumber = 2
		ds_list_add(buttons, AmbushedChase, AmbushedLetGo)
		ds_list_add(buttonStats, 3, 0)
		ds_list_add(buttonRequires, global.eventDiff[3, 1], 0)
		ds_list_add(buttonCosts, 0, 0)
		ds_list_add(buttonText, "Chase them down!", "Let them go")
        
		global.allowSelect = false
		captionText = "Ambush!"
    
		eventText = "An enemy ship is spotted preparing for an ambush, but upon seeing your ship they begin to run!"   
		global.moraleBoost = "ambush"
		}
	}
	
}
