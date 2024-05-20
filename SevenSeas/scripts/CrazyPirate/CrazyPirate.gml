function CrazyPirate(argument0) {
	//Crazy Pirate
	global.moraleBoost = "crazy pirate"
	if argument0 = undefined
	    myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	else
	    myPirate = argument0

	result = irandom(10)

	with Pirate
	    UpdateMorale(-2, 1)
    
	if result < 4
	    {
	    cargoThrown = LoseRandomCargo(min(irandom_range(2,1 + 2*(global.seaLevel+1)), CargoAmount(-1)))
	    ds_list_add(global.notificationList, "Insane Pirate!", myPirate.name + " went crazy! they threw#" + cargoThrown + "overboard!")
    
	    LoseCargo(4, min(CargoAmount(4), (global.seaLevel*2) + irandom_range(1,2)))
	    }
	else if result < 8
	    {
	    injuredCrew = 0
	    with Pirate
	        if irandom(1) == 0
	            {
	            other.injuredCrew ++
	            myHealth -= 20
	            }
            
	    ds_list_add(global.notificationList, "Insane Pirate!", myPirate.name + " went crazy! They injured " + string(injuredCrew) + " of the crew!")
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Insane Pirate!", myPirate.name + " went crazy! They jumped overboard!")
    
	    with myPirate
	        {
	        injured = true
	        myHealth = -20
	        }
	    instance_destroy()
	    }
    
	if object_index = ConditionTimer
	    {
	    if irandom(1)
	        timer = room_speed*random_range(1,5)
	    else
	        instance_destroy()
	    }
}
