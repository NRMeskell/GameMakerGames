function RestfulWaters() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 2
		planksNeeded = max(1, min(CargoAmount(3), (Ship.maxHealth - Ship.myHealth) div 10 + 1))
	    ds_list_add(buttons, RestfulRaiseMorale, RestfulHealCrew, RestfulRepairShip)
	    ds_list_add(buttonStats, 5, 6, 3)
	    ds_list_add(buttonRequires, global.eventDiff[5,0], global.eventDiff[6, 0], 0)
	    ds_list_add(buttonCosts, 0, 0, planksNeeded)
	    ds_list_add(buttonText, "raise crew morale", "heal crew injuries", "repair the ship")
        
	    global.allowSelect = false
	    captionText = "Restful Waters!"
	    eventText = "The seas are calm and peaceful, perfect for a little recovery."   
	    global.moraleBoost = "resting"
	    }
}

function RestfulRaiseMorale(){
	if argument0{
		UpdateMorale(1, -1)
		ds_list_add(global.notificationList, "Pirate Tales!", "The crew enjoy the stories and relaxation, and overall morale is raised.")
	}
	else{
		ds_list_add(global.notificationList, "No Effect", "The peaceful waters do nothing to raise morale.")
	}
}

function RestfulHealCrew(){
	if argument0{
		UpdateHealth(Pirate, (maxHealth - myHealth) div 2)
		ds_list_add(global.notificationList, "Medical Break!", "The injured crew members are treated and regain health!")
	}
	else{
		ds_list_add(global.notificationList, "No Effect", "The calming waves do nothing to help the injured crew.")
	}
}

function RestfulRepairShip(){
	UpdateHealth(Ship, (Ship.maxHealth div 10) * planksNeeded)
	
	ds_list_add(global.notificationList, "Ship Repaired", string(planksNeeded) + " plank(s) were used to patch up the damaged ship.")
	
}

