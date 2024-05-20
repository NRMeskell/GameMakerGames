function MerchantLetGo() {
	//engage

	with Pirate
	    UpdateMorale(-1, global.FEARSOME)
	with ShipEvent
	    {
	    runAway = true
	    floatAway = true
	    }
	script_execute(closeEventCode, 2)







}
