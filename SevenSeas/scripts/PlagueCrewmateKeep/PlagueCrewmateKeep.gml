function PlagueCrewmateKeep() {
	//Keep aboard
	if instance_exists(eventValue)
	if eventValue.injured == true{
		result = irandom(global.totalMedicalBonus*2)
		if result < 2
		    {
		    with eventValue
		        event_user(2)
        
		    ds_list_add(global.notificationList, "Fatal desease!", "the disease kills " + eventValue.firstName + ", but thankfully it does not spread further!")
		    }
		else if result < 5
		    {       
			pirateFound = noone
		    with Pirate{
				if other.pirateFound == noone and id != eventValue and injured == false{
					injured = true
					other.pirateFound = id
					}			
		        }
			if pirateFound == noone
				ds_list_add(global.notificationList, "slow recovery!", eventValue.firstName + " remains sick, but will recover once in port. The illness does not spread.")
			else
				ds_list_add(global.notificationList, "Sickness spreads!", "the disease spreads to " + pirateFound.name + " and they will recover once in port.")
		    }
		else
		    {
		    with eventValue
		        injured = false
        
		    ds_list_add(global.notificationList, "quick recovery!", eventValue.name + " recovers well, and the illness does not spread!")
		    }
    
		script_execute(closeEventCode, 2)
		}
}
