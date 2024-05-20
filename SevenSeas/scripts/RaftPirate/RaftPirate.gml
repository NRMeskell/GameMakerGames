function RaftPirate() {
	//Raft Pirate

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, RaftPirateLetFloat, RaftPirateFood, RaftPirateGrab) 
	    ds_list_add(buttonStats, 0, 4, 3)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[3, 3])
	    ds_list_add(buttonCosts, 0, 1, 0)
	    ds_list_add(buttonText, "Let the raft float by", "Throw the sailor food", "Hoist the sailor aboard")
        
	    global.allowSelect = false
	    captionText = "A raft be floating by!"
	    eventText = "inside is a single worn-down sailor!"  
	    global.moraleBoost = "raft" 
	    }

	instance_create(0,0,RaftEvent)






}
