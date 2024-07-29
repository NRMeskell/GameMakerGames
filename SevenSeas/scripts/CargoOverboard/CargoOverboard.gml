function CargoOverboard() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, CargoOverboardLetGo, CargoOverboardSave)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3,1], global.eventDiff[3,3])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "hold fast!", "Secure the cargo!")
        
	    global.allowSelect = false
	    eventValue = irandom_range(script_execute(CargoAmount, -1) div 8, script_execute(CargoAmount, -1) div 5)
	    captionText = "Cargo be washing away!"
	    eventText = string(eventValue) + " will go overboard if pirates not be sent to secure it!"   
	    global.moraleBoost = "overboard"
	    }
	}
		

function CargoOverboardLetGo() {
	//lose cargo

	cargoLost = eventValue
	cargoLostNames = LoseRandomCargo(cargoLost)

	ds_list_add(global.notificationList, "Cargo knocked overboard!", "Cargo lost:#" + cargoLostNames)
        
	script_execute(closeEventCode, 2)
}

function CargoOverboardSave() {
	//save all cargo	
	var pirateText = ""
	if irandom(1){
		overboardPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		pirateText = " " + overboardPirate.name + " was hurt during the chaos!"
		overboardPirate.myHealth = 20 + global.seaLevel * 20
	}
	
	if argument0{
		ds_list_add(global.notificationList, "The cargo is secured!", "The crew managed to secure the cargo." + pirateText)
	}
	else{
		cargoLost = eventValue
		cargoLostNames = LoseRandomCargo(cargoLost)
		ds_list_add(global.notificationList, "The cargo is lost!", cargoLostNames + " tumbled overboard!" + pirateText)
	}
	
	script_execute(closeEventCode, 2)
}