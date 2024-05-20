function CargoOverboard() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, CargoOverboardLetGo, CargoOverboardSaveSome, CargoOverboardSaveAll)
	    ds_list_add(buttonStats, 0, 3, )
	    ds_list_add(buttonRequires, 0, global.eventDiff[3,1], global.eventDiff[3,3])
	    ds_list_add(buttonCosts, 0, 0, )
	    ds_list_add(buttonText, "hold fast!", "Secure easy cargo!", "Secure all cargo")
        
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

function CargoOverboardSaveSome() {
	//save all cargo	
	if argument0{
		cargoLost = eventValue
		cargoLostNames = LoseRandomCargo(cargoLost) div 2
		ds_list_add(global.notificationList, "Some cargo is secured!", "The crew managed to secure half the cargo, and only " + string(cargoLost) + " cargo was lost")

	}
	else{
		//Injure pirates
		cargoLost = eventValue
		cargoLostNames = LoseRandomCargo(cargoLost)
		
		piratesInjured = 0
		with Pirate 
		    if irandom(1)
		        {
		        myHealth -= irandom_range(10, 30)
		        other.piratesInjured ++
		        }
	
		ds_list_add(global.notificationList, "Crew hurt!", string(piratesInjured) + " pirates were crushed by tumbling cargo, and all " + string(cargoLost) + " cargo was lost!")
	}
	script_execute(closeEventCode, 2)
}

function CargoOverboardSaveAll() {
	//save all cargo	
	if argument0{
		ds_list_add(global.notificationList, "All cargo secured!", "The crew managed to secure the cargo, and none was lost.")

	}
	else{
		//Injure pirates
		cargoLost = eventValue
		cargoLostNames = LoseRandomCargo(cargoLost)
		
		piratesInjured = 0
		with Pirate 
		    if irandom(1)
		        {
		        myHealth -= irandom_range(10, 30)
		        other.piratesInjured ++
		        }
	
		ds_list_add(global.notificationList, "Crew hurt!", string(piratesInjured) + " pirates were crushed by tumbling cargo, and all " + string(cargoLost) + " cargo was lost!")
	}
	script_execute(closeEventCode, 2)
}