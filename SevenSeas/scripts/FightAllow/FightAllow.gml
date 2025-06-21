function FightAllow() {

	if irandom(1) and myPirate.myMainPer != 3
	    {
	    with myPirate
	        {
	        UpdateMorale(-1, -1)
	        UpdateMorale(-1, global.FEARSOME)
	        UpdateHealth(id, -irandom(25*(1+global.seaLevel)))
	        other.itemLost = LoseRandomItem()
	        }
	    ds_list_add(global.notificationList, myPirate.firstName + " lost!", "they were beat badly, and their " + itemLost + " was taken!")
		}
	else
	    {
	    with myPirate
	        {
	        UpdateMorale(1, -1)
	        UpdateMorale(1, global.FEARSOME)
	        UpdateHealth(id, -irandom(10*(1+global.seaLevel)))
	        }
        
	    ds_list_add(global.notificationList, myPirate.firstName + " won!", "they were victorious and gain morale.")
		}

	script_execute(closeEventCode)






}
