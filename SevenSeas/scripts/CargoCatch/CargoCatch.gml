function CargoCatch() {
	//Dont let play

	if argument0
	    {
	    with Pirate {
	        UpdateMorale(1, global.FEARSOME) 
			}	
	    ds_list_add(global.notificationList, "caught!", "The theives were caught and punished severely, before being bound and left for authorities!")
	    AddReputation("fear", 2, "caught theives")
		AddReputation("patrol", 1, "caught theives")
		}
	else
	    {
	    stolenItems = LoseRandomCargo(irandom_range(1,2*global.seaLevel))
	    ds_list_add(global.notificationList, "escaped!", "The theives escaped, getting away with cargo:#" + stolenItems)
	    with Pirate {
	        UpdateMorale(-1, global.FEARSOME) 
			}	
		AddReputation("fear", -1, "escaped theives")
		}

	script_execute(closeEventCode)
}
