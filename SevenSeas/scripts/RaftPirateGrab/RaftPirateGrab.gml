function RaftPirateGrab() {
	//Let aboard
	if argument0{
	
		newPirate = CreatePirate(true)
    
		if newPirate != undefined
		    {
		    UpdateMorale(1,  global.JOLLY)
		    UpdateMorale(-1,  global.FEARSOME)
			with newPirate
				UpdateMorale(1, -1)
    
		    if irandom(10) < 5
		        {
		        with instance_create(0,0,ConditionTimer)
		            {
		            condition = CrazyPirate
		            myArgument = other.newPirate
		            }
		        }
			else if irandom(1){
				myGoal = "leave"
				
			}
        
		    ds_list_add(global.notificationList, "The pirate climbs aboard!", newPirate.name + " gratefully joins the crew. They look tired and a little insane, but hopefully that goes away with food and time!")

		    with RaftEvent
		        {
		        image_index = 1
		        }
		    }
		else
		    {
		    ds_list_add(global.notificationList, "No room on board!", "the pirate floats away, unable to fit on the ship")
		    with RaftEvent
		        floatAway = true
        
		    with Pirate
		        UpdateMorale(-1, global.JOLLY)
		    }
	}
    else{
		ds_list_add(global.notificationList, "Sailor drowned!", "The sailor, too weak to climb, fails to hold on to the rope and falls back in to the sea.") 
		UpdateMorale(-2,  global.JOLLY)
		UpdateMorale(-1,  global.DARING)
		UpdateMorale(-1,  -1)
		with RaftEvent
			image_index = 1
	}
	
	script_execute(closeEventCode)
}
