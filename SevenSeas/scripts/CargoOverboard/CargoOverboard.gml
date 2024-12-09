function CargoOverboard() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 2
	    ds_list_add(buttons, CargoOverboardSave, CargoOverboardMedical)
	    ds_list_add(buttonStats, 3, 6)
	    ds_list_add(buttonRequires, global.eventDiff[3,2], global.eventDiff[6,2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Secure the cargo!", "Secure the cargo!")
        
	    global.allowSelect = false
	    eventValue = irandom_range(script_execute(CargoAmount, -1) div 8, script_execute(CargoAmount, -1) div 5)
	    eventPirate = RandomPirate()
		captionText = "Cargo be washing away!"
	    eventText = "An barrel of " + string(eventValue) + " cargo slams into " + eventPirate.name + " and begins washing overboard!" 
	    global.moraleBoost = "untied cargo"
	    }
	}
		

function CargoOverboardMedical() {
	//lose cargo
	var cargoFlavor = LoseRandomCargo(eventValue)

	if argument0{
		ds_list_add(global.notificationList, "Successful Treatment!", eventPirate.name + " fully recovers, but " + cargoFlavor + " tumbles overboard!")	
	}
	else{
		ds_list_add(global.notificationList, "Failed Treatment!", eventPirate.name + " injuries are too great and " + cargoFlavor + " tumbles overboard!")	
		eventPirate.myHealth -= 20 + global.seaLevel*15
	}
	
	script_execute(closeEventCode, 2)
}

function CargoOverboardSave() {
	//save all cargo	
	eventPirate.myHealth -= 20 + global.seaLevel*15
	
	if argument0{
		ds_list_add(global.notificationList, "Cargo secured!", "The crew managed to secure the cargo, but " + eventPirate + " is left untreated!")
	}
	else{
		var cargoFlavor = LoseRandomCargo(eventValue)
		ds_list_add(global.notificationList, "Cargo lost!", cargoFlavor + " tumbles overboard, and " + eventPirate + " is left untreated!")
	}
	
	script_execute(closeEventCode, 2)
}