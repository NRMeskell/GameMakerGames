function TropicalRest() {
	//run away
	global.moraleBoost = "rested"
	with Pirate
	    UpdateMorale(1, global.JOLLY)

	result = irandom(2)
    
	if result == 0
	    {
	    Ship.myHealth -= 25
	    ds_list_add(global.notificationList, "Crew rested", "The crew is rested and morale is raised, but the ship was slightly damaged without the crew!") 
	    }
	else if result == 1
	    {
	    with Pirate
	        if irandom(1)
	            myHealth -= 10
	    ds_list_add(global.notificationList, "Crew rested", "The crew is rested and morale is raised, but some pirates still suffered from exhaustion!") 
	    }
	else if result == 2
	    {
	    itemsTaken = ""
	    if irandom(2) == 0
	        itemsTaken += LoseRandomItems(irandom(global.seaLevel)+1)
	    else
	        itemsTaken += LoseRandomCargo(irandom_range(1 + global.seaLevel, 2 + global.seaLevel))

	    ds_list_add(global.notificationList, "Crew rested", "The crew is rested and morale is raised, but some unattended cargo fell overboard:#" + itemsTaken) 
	    }

	script_execute(closeEventCode, 2)







}
