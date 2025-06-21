function TradingPostRest() {
	//rest
	with Pirate
	    {
	    myHealth = maxHealth
	    global.moraleBoost = "rest"
	    UpdateMorale(1, -1)
	    }
    
	while HasStored(3,1) and (Ship.myHealth < Ship.maxHealth)
	    {
	    UpdeateHealth(Ship, Ship.maxHealth div 10)
	    LoseCargo(3,1)
	    }
    
	ds_list_add(global.notificationList, "A good night's sleep!", "The crew is well rested and the ship's repaired!")
    
	script_execute(closeEventCode, 2)
}

function TradingPostResting() {
	Wait(1/4*Clock.fullDay, TradingPostRest, argument0)
}
