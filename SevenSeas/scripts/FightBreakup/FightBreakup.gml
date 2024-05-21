function FightBreakup() {
	// safely play

	if argument0{
		ds_list_add(global.notificationList, "fight stopped!", "the fight is broken up, and all parties leave reasonably satisfied!")
		with Pirate{
		    UpdateMorale(1, global.JOLLY)
			UpdateMorale(-1, global.FEARSOME)
		}
	}
	else{
		with myPirate
	        {
	        UpdateMorale(1, global.FEARSOME)
	        myHealth -= irandom(5*global.seaLevel)
	        }
		ds_list_add(global.notificationList, "fight continues!", "neither party listens to reason, and the fight continues until the town guard arrives!")
	}
	
	script_execute(closeEventCode)

}
