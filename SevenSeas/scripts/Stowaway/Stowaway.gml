function Stowaway() {
	//Raft Pirate

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3 
	    ds_list_add(buttons, StowawayWalk, StowawayFlog, StowawayLetAboard) 
	    ds_list_add(buttonStats, 0, 0, 5) 
	    ds_list_add(buttonRequires, 0, 0, max(3, global.eventDiff[5, 3] - (searchReputationType("repute")[0] div 2)))
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "make them walk the plank", "flog them as punishment", "get them to join the crew")
        
	    global.allowSelect = false
	    captionText = "Stowaway!"
	    foodAmount = min(CargoAmount(4), irandom_range(2, irandom(instance_number(Pirate))))
    
	    eventText = "a ragged stowaway was hiding in a food barrel! "
	    global.moraleBoost = "Stowaway"
	    }






}
