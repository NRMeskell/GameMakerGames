function FightJoin() {
	//Dont let play

	if argument0
	    {
	    with Pirate
	        {
	        UpdateMorale(1,-1)
	        UpdateMorale(1, global.FEARSOME)
	        myHealth -= irandom(5*global.seaLevel)
	        }
		if searchReputationType("repute")[0] < 3{ 
		    ds_list_add(global.notificationList, "victory!", "with the help of the crew, " + myPirate.firstName + " wins the fight!")
		    AddReputation("fear", 1, "street fight victory")
			}
		else{
			ds_list_add(global.notificationList, "victory!", "Having heard tales of your " + searchReputationType("fear")[1] + ", the other party flees the scene.")
			}
		}
	else
	    {
		with Pirate
	        {
	        UpdateMorale(1, -1)
	        myHealth -= irandom(5*global.seaLevel)
	        }
			
		if irandom(1){
		    LoseCargo(0, min(CargoAmount(0), 10))
		    ds_list_add(global.notificationList, "gaurds arrive!", "the guards arrive to break up the fight, and fine you 10 gold for breaking port rules.")
		    AddReputation("patrol", -1, "disruptive street brawl")
			}
		else{
		    ds_list_add(global.notificationList, "defeat!", "The others are stronger than you guessed, and the crew suffers an embarrassing defeat.")
		    AddReputation("fear", -1, "lost street brawl")
			
			with Pirate
		        {
		        UpdateMorale(1, global.FEARSOME)
		        myHealth -= irandom(2*global.seaLevel)
		        }
			}
			
		}


	script_execute(closeEventCode)
}
