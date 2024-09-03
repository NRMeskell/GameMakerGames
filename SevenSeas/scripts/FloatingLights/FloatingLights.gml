function FloatingLights() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, FloatingLightsWait, FloatingLightsChase, FloatingLightsAccept)
	    ds_list_add(buttonStats, 3, 3, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3,1], global.eventDiff[6,2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "Wait for them to leave", "chase away the lights", "observe the lights")
        
		myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    global.allowSelect = false
	    captionText = "Floating lights!"
    
	    eventText = "Mysterious lights are floating around the ship, lingering near any injured crew members."
	    global.moraleBoost = "lights"  
		
		repeat(5)
			instance_create(0, 0, FloatingLight)
	    }
}

function FloatingLightsWait() {
	injuredCrew = false
	with Pirate{
		if (myHealth < maxHealth/2 and irandom(1)==0){
			other.injuredCrew = true
			other.injuredPirate = id
		}
	}
	
	if !injuredCrew {
		UpdateMorale(1, -1)
		UpdateMorale(1, global.KEEN)
		ds_list_add(global.notificationList, "lights depart!", "the lights drift away, greatly relieving the crew.")
	}
	else{
		if irandom(2) = 0{
			ds_list_add(global.notificationList, "mysterious disappearance!", "The lights swarm about " + injuredPirate.name + ", and when they leave " + injuredPirate.firstName + " is gone!")
			with injuredPirate
				myHealth = 0
		}
		else{
			ds_list_add(global.notificationList, "mysterious healing!", "The lights swarm about " + injuredPirate.name + "! The lights appear to heal them of their ailments before departing.")
			with injuredPirate{
				myHealth = maxHealth
				UpdateMorale(2, -1)
			}
		}
	}
}

function FloatingLightsChase() {	
	if argument0{
		ds_list_add(global.notificationList, "Lights scattered!", "The lights scatter, and soon fly away from the ship.")
		UpdateMorale(1, -1)
	}
	else{
		ds_list_add(global.notificationList, "lights attack!", "The lights begin to swarm and attack the crew, burning their skin when close!")
		with Pirate
			myHealth -= 20 + irandom(10)
	}
}

function FloatingLightsAccept(){
	injuredCrew = false
	with Pirate{
		if (myHealth < maxHealth/2 and irandom(1)==0){
			other.injuredCrew = true
			other.injuredPirate = id
		}
	}
	
	if argument0 {
		if injuredCrew{
			ds_list_add(global.notificationList, "mysterious healing!", "The crew watch carefully as the lights swarm and heal " + injuredPirate.name + ".")
			with injuredPirate{
				myHealth = maxHealth
				UpdateMorale(2, -1)
			}
			UpdateMorale(1, global.KEEN)
		}
		else{
			ds_list_add(global.notificationList, "light depart!", "The crew watch carefully as the lights wander and disappear.")
			UpdateMorale(1, global.KEEN)
		}
	}
	else{
		ds_list_add(global.notificationList, "burning lights!", "the crew watch too closely, and the lights burn their eyes and skin!")
		with Pirate
			myHealth -= 10 + irandom(10)
	}
}

