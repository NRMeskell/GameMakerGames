function Surgery() {
	with instance_create(0,0,Event)
	    {
		eventValue = Ship
		var healthPer = Ship.myHealth/Ship.maxHealth;
		for(var i=0; i<instance_number(Pirate); i++){
			var checkPer = instance_find(Pirate, i).myHealth/instance_find(Pirate, i).maxHealth
			if checkPer < healthPer{
				healthPer = checkPer
				eventValue = instance_find(Pirate, i)
			}
		}
		
		if healthPer > 0.75{
			RestfulWaters();
			instance_destroy();
			return;
		}
		
	    buttonNumber = 2
		if eventValue.object_index == Ship{
		    ds_list_add(buttonStats, 0, 3)
		    ds_list_add(buttonRequires, 0, 0)
		    ds_list_add(buttonCosts, 0, min(1, CargoAmount(3), (Ship.maxHealth - Ship.myHealth) div 15 + 1))
			ds_list_add(buttons, RepairIgnore, RepairGive)
			ds_list_add(buttonText, "Continue without repairs", "Provide emergency repairs")	
			captionText = "Repairs!"
		    eventText = "the ship is in need of emergency reconstruction."   
		    global.moraleBoost = "repairs"
		}
		else {
			ds_list_add(buttonStats, 0, 6)
		    ds_list_add(buttonRequires, 0, global.eventDiff[6, 2])
		    ds_list_add(buttonCosts, 0, 0)
			ds_list_add(buttons, SurgeryIgnore, SurgeryGive)
			ds_list_add(buttonText, "Continue without treatment", "Provide emergency care")	
			captionText = "Surgery!"
		    eventText = eventValue.name + " is in need of emergency medical attention"   
		    global.moraleBoost = "surgery"
		}
		
	    global.allowSelect = false
	}
}


// Repair the ship
function RepairIgnore(){
	ds_list_add(global.notificationList, "ship ignored!", "The crew continue sailing their broken ship into the open seas.")
}

function RepairGive(){
	var planksUsed = min(1, CargoAmount(3), (Ship.maxHealth - Ship.myHealth) div 15 + 1)
	Ship.myHealth += (Ship.maxHealth div 10) * planksUsed
	
	ds_list_add(global.notificationList, "Ship Repaired", planksUsed + " plank(s) were used to patch up the damaged ship.")
	
}


// Provide Medical Attention
function SurgeryIgnore(){
	with eventValue
		UpdateMorale(-2, -1)
		
	ds_list_add(global.notificationList, eventValue.firstName + " ignored!", "The crew continue sailing, and " + eventValue.firstName + " is forced to work through the pain.")
}

function SurgeryGive(){
	if argument0{
		with Pirate myHealth = maxHealth
		ds_list_add(global.notificationList, "Successful Surgery!", eventValue.firstName + " returns to work feeling much better!")
	}
	else{
		ds_list_add(global.notificationList, "Horrible surgery!", "The surgery goes horribly wrong, and " + eventValue.firstName + " looses their limb.")
	}
}

