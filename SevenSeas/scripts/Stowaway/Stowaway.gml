function Stowaway() {
	//Raft Pirate

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3 
	    ds_list_add(buttons, StowawayWalk, StowawayLetAboard) 
	    ds_list_add(buttonStats, 0, 5) 
	    ds_list_add(buttonRequires, 0, max(3, global.eventDiff[5, 3]))
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "make them walk the plank", "allow them to join the crew")
        
	    global.allowSelect = false
	    captionText = "Stowaway!"
	    eventText = "a ragged stowaway was hiding in a barrel!"
	    global.moraleBoost = "Stowaway"
	    }






}
