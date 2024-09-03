function SkelRaftPirate() {
	//Raft Pirate

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, RaftPirateLetFloat, SkelRaftPirateFood, SkelRaftPirateGrab) 
	    ds_list_add(buttonStats, 0, 4, 3)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[3, 3])
	    ds_list_add(buttonCosts, 0, 1, 0)
	    ds_list_add(buttonText, "Let the raft float by", "Throw the sailor food", "Hoist the sailor aboard")
        
	    global.allowSelect = false
	    captionText = "A raft be floating by!"
	    eventText = "inside is a sailor who looks somewhat strange from a distance."  
	    global.moraleBoost = "raft" 
	    }

	instance_create(0,0,RaftEvent)
}


function SkelRaftPirateFood() {
	//interrogate
	ds_list_add(global.notificationList, "Food thrown back!", "The sailor throws the food back, claiming that they won't need it.")
	StoreItem(4, 1)
    
	script_execute(closeEventCode)
}


function SkelRaftPirateGrab() {
	//Let aboard
	if argument0{
		newPirate = CreatePirate(true)
    
		if newPirate != undefined
		    {
		    UpdateMorale(-3, -1)
		    UpdateMorale(1, global.FEARSOME)
			UpdateMorale(1, global.DARING)
    
		    if irandom(1){
				myGoal = "leave"
			}
        
		    ds_list_add(global.notificationList, "The pirate climbs aboard!", "the skeletal sailor joins the crew, although the crew are unsettled. "  + newPirate.firstName +  "  will not need food!")
			with newPirate{
				body = sprite_get_number(PirateManSkinSpr)-1
				face = sprite_get_number(PirateManFaceSpr)-1
				skinColor = c_ltgray
				beard = 0
				if hair = 0
					hair = choose(1, sprite_get_number(PirateHairSpr)-1)
				
				if surface_exists(fullPirateSurface)
					MakePirateSurface(fullPirateSurface, 0, 0)
				if surface_exists(smallPirateSurface)
					MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
				if surface_exists(tagPirateSurface)
					MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)

			}

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
		ds_list_add(global.notificationList, "Sailor drowned!", "The sailor, too weak to climb, fails to hold on to the rope and falls back into the sea.") 
		UpdateMorale(-2,  global.JOLLY)
		UpdateMorale(-1,  global.DARING)
		UpdateMorale(-1,  -1)
		with RaftEvent
			image_index = 1
	}
	
	script_execute(closeEventCode)
}
