function BoilingWater() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, BoilingCargo, BoilingCrew)
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Send crew to save cargo", "Move crew to upper decks")
        
	    global.allowSelect = false
	    captionText = "The Ocean is boiling!"
	    eventText = "The boiling water will seep into damaged ships, burning the crew and cargo!"   
	    global.moraleBoost = "boiling"
	    }

	instance_create(0,0,WaterBoiler)
}


function BoilingCargo(){
	var damageMultiplier = sqrt(Ship.myHealth/Ship.maxHealth)
	
	var cargoLost = LoseRandomCargo(irandom(CargoAmount(-1)*(1-damageMultiplier)))
	
	if cargoLost != ""
		ds_list_add(global.notificationList, "Cargo Boiled!", "Water splashed into the cargo hold, damaging " + cargoLost + "!")
	else
		ds_list_add(global.notificationList, "Cargo Safe!", "The sturdy ship resisted the boiling water!")
}

function BoilingCrew(){
	var damageMultiplier = sqrt(Ship.myHealth/Ship.maxHealth)
	
	var damaged = false
	with Pirate{
		var damage = irandom(maxHealth * (1-damageMultiplier))
		UpdateHealth(id, damage)
		if damage > 0
			damaged = true
	}
	
	if damaged
		ds_list_add(global.notificationList, "Crew Burned!", "The crew saved the cargo, but were splashed by the boiling water!")
	else
		ds_list_add(global.notificationList, "Crew Safe!", "The sturdy ship resisted the boiling water!")
}
