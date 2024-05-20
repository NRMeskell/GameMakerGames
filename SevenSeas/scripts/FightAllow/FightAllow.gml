function FightAllow() {

	if irandom(1) and myPirate.myMainPer != 3
	    {
	    with myPirate
	        {
	        UpdateMorale(-1, -1)
	        UpdateMorale(-1, global.FEARSOME)
	        myHealth -= maxHealth div 4
	        other.itemLost = LoseRandomItem()
	        }
	    ds_list_add(global.notificationList, myPirate.firstName + " lost!", "they were beat badly, and their " + itemLost + " was taken!")
		AddReputation("fear", -2, "lost street-brawl")
		}
	else
	    {
	    with myPirate
	        {
	        UpdateMorale(1, -1)
	        UpdateMorale(1, global.FEARSOME)
	        myHealth -= maxHealth div 8
	        }
        
	    ds_list_add(global.notificationList, myPirate.firstName + " won!", "they were victorious and gain morale.")
		AddReputation("fear", 1, "lost street-brawl")
		}

	script_execute(closeEventCode)






}
