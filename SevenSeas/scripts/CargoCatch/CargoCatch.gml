function CargoCatch() {
	//Dont let play

	if argument0
	    {
	    with Pirate {
	        UpdateMorale(1, global.FEARSOME) 
			}	
	    ds_list_add(global.notificationList, "caught!", "The thieves were caught and punished severely, before being bound and left for authorities!")
		}
	else
	    {
	    stolenItems = LoseRandomCargo(irandom_range(1,2*global.seaLevel))
	    ds_list_add(global.notificationList, "escaped!", "The thieves escaped, getting away with cargo:#" + stolenItems)
	    with Pirate {
	        UpdateMorale(-1, global.FEARSOME) 
			}	

		}

	script_execute(closeEventCode)
}
