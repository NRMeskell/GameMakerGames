function script108() {
	//Dont let play

	if irandom(2) > 0
	    {
	    with Pirate
	        {
	        UpdateMorale(1,-1)
	        myHealth -= irandom(5*global.seaLevel)
	        }
        
	    ds_list_add(global.notificationList, "victory!", "with the help of the crew, " + myPirate.firstName + "wins the fight!")
	    }
	else
	    {
	    LoseCargo(0, min(CargoAmount(0), 10))
	    ds_list_add(global.notificationList, "gaurds arrive!", "the guards arrive to break up the fight, and fine you 10 gold for breaking port rules.")
	    }


	script_execute(closeEventCode)







}
