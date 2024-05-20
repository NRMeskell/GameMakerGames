function BugsCover() {

	if argument0{
		with Pirate 
		    {
		    UpdateMorale(choose(-1,0), -1)
		    }
    
		ds_list_add(global.notificationList, "Crew covered", "the crew cover up and mostly avoid the bugs")
	}
	else{
		with Pirate 
		    {
		    UpdateMorale(-1, -1)
		    }
			
		var lostCargo = LoseRandomCargo(irandom(global.seaLevel) + 1)
    
		ds_list_add(global.notificationList, "Crew uncovered!", "the crew cannot cover themselves, and some cargo is lost in the scramble for cloth:#" + lostCargo)
	
	}
	script_execute(closeEventCode, 2)
}
