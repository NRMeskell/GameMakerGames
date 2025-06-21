function Scurvy() {
	with instance_create(0,0,Event)
	    {
		eventValue = RandomPirate()
	    buttonNumber = 2
	    ds_list_add(buttons, ScurvyIgnore, ScurvyHelp)
	    ds_list_add(buttonStats, 0, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[6, 0])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "ignore the problem", "provide " + eventValue.firstName + "  medical care")
        
	    global.allowSelect = false
	    captionText = "Scurvy!"
	    eventText = eventValue.name + " has come down with a horrible case of scurvy, and requires healing!"   
	    global.moraleBoost = "scurvy"
	    }
}

function ScurvyIgnore(){	
	ds_list_add(global.notificationList, "Awful Condition!", "Poor " + eventValue.firstName + " worsens without treatment! Their skin cracks throughout the day." )
	
	with instance_create(0,0,ConditionTimer){ 
		myArgument = other.eventValue
		condition = ScurvyReturn 
	} 
}

function ScurvyHelp(){
	if argument0{
		ds_list_add(global.notificationList, "Condition Relieved!", "A fresh fruit is found in the medical bay, and " + eventValue.firstName + " quickly recovers." )
	}
	else{
		if irandom(3) == 0{
			var limb; 
			with eventValue
				limb = LoseLimb(undefined)
				
			ds_list_add(global.notificationList, "Removed limb!", "The doctor removed " + eventValue.firstName + "'s " + limb + ", but this did not seem to relieve the symptoms.")
			
		
			with instance_create(0,0,ConditionTimer){ 
				myArgument = other.eventValue
				condition = ScurvyReturn 
			}
		
		} else{
			ds_list_add(global.notificationList, "Blood Letting!", "The doctor was unable to find " + eventValue.firstName + "'s bad blood, no matter how much they let out.") 
			UpdateHealth(eventValue, -15 - 10*global.seaLevel)
		
			with instance_create(0,0,ConditionTimer){ 
				myArgument = other.eventValue
				condition = ScurvyReturn 
			}
		}
	}
}

function ScurvyReturn(){
	ds_list_add(global.notificationList, "Scurvy Worsens!", "A small cut on " + myArgument.firstName + "'s arm won't stop bleeding, and they lose a significant amount of blood!")
	UpdateHealth(myArgument, -15 - 10*global.seaLevel)
	if irandom(1){
		with instance_create(0,0,ConditionTimer){ 
		myArgument = other.myArgument
		condition = ScurvyReturn 
		}
	}
}

