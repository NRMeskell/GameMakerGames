function FightJoin() {
	//Dont let play

	if argument0
	    {
	    with Pirate
	        {
	        UpdateMorale(1,-1)
	        UpdateMorale(1, global.FEARSOME)
	        myHealth -= irandom(5*(1+global.seaLevel))
	        }
		ds_list_add(global.notificationList, "victory!", "the other party flees the scene, leaving the day as ours!")
		}
	else
	    {
		with Pirate
	        {
	        UpdateMorale(1, -1)
	        myHealth -= irandom(10*(1+global.seaLevel))
	        }
			
		if irandom(1){
		    LoseCargo(0, min(CargoAmount(0), 10))
		    ds_list_add(global.notificationList, "gaurds arrive!", "the guards arrive to break up the fight, and fine you 10 gold for breaking port rules.")
			}
		else{
		    ds_list_add(global.notificationList, "defeat!", "The others are stronger than you guessed, and the crew suffers an embarrassing defeat.")			
			with Pirate
		        {
		        UpdateMorale(1, global.FEARSOME)
		        myHealth -= irandom(20*(1+global.seaLevel))
		        }
			}
			
		}


	script_execute(closeEventCode)
}
