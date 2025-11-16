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
		
		if healthPer > 0.5{
			RestfulWaters();
			instance_destroy();
			return;
		}
		
	    buttonNumber = 2
		if eventValue.object_index == Ship{
			planksNeeded = PlanksNeededForRepairs()
			
		    ds_list_add(buttonStats, 0, 3)
		    ds_list_add(buttonRequires, 0, 0)
		    ds_list_add(buttonCosts, 0, max(1, planksNeeded))
			ds_list_add(buttons, RepairIgnore, RepairGive)
			ds_list_add(buttonText, "Continue sailing", "Use boards to make repairs")	
			captionText = "Repairs!"
		    eventText = "the ship is in poor condition and could use patching."   

			global.moraleBoost = "repairs"
		}
		else {
			ds_list_add(buttonStats, 0, 6)
		    ds_list_add(buttonRequires, 0, global.eventDiff[6, 1])
		    ds_list_add(buttonCosts, 0, 0)
			ds_list_add(buttons, SurgeryIgnore, SurgeryGiving)
			ds_list_add(buttonText, "Continue sailing", "Take time to give treatment")	
			captionText = "Surgery!"
		    eventText = eventValue.name + " is in poor condition, and could use medical attention."   
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
	UpdateHealth(Ship, planksNeeded*(Ship.maxHealth div 10))
	
	ds_list_add(global.notificationList, "Ship Repaired", string(planksNeeded) + " plank(s) were used to patch up the damaged ship.")
	
}


// Provide Medical Attention
function SurgeryIgnore(){
	with eventValue
		UpdateMorale(-1, -1)
		
	ds_list_add(global.notificationList, eventValue.firstName + " ignored!", "The crew continue sailing, and " + eventValue.firstName + " is forced to work through the pain.")
}

function SurgeryGive(){
	if argument0{
		with eventValue myHealth = maxHealth
		ds_list_add(global.notificationList, "Successful Surgery!", eventValue.firstName + " returns to work feeling much better!")
	}
	else{
		ds_list_add(global.notificationList, "Unsuccessful surgery!", "The ship's doctor was unable to do anything to help " + eventValue.firstName + ".")
	}
}

function SurgeryGiving(){
	Wait(1/8*Clock.fullDay, SurgeryGive, argument0)
}

