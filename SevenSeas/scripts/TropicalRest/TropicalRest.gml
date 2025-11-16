function TropicalResting(){
	Wait(Clock.fullDay/6, TropicalRest, argument0)
}

function TropicalRest() {
	//run away
	global.moraleBoost = "rested"
	with Pirate
	    UpdateMorale(1, global.JOLLY)

	result = irandom(2)
    
	if result == 0
	    {
	    UpdateHealth(Ship, -75)
	    ds_list_add(global.notificationList, "Crew rested", "The crew is rested and morale is raised, but the ship was slightly damaged without the crew!") 
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Crew rested", "The crew's morale raises and exhaustion is avoided!") 
	    }
}
