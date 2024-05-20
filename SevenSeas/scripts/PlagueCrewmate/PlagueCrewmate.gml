function PlagueCrewmate(argument0) {
	
	//Sick Crewmate
	ds_list_add(global.notificationList, "Crewmate has plague!", eventValue.name + " becomes ill! They may spread the sickness among the crew, unless the ship's medical capabilities are good enough!")
	
	if eventValue.injured == false
		eventValue.injured = true
	else
		eventValue.myHealth *= 0.5
		
	with instance_create(0,0,ConditionTimer){
	    condition = PlagueCrewmateKeep
		eventValue = other.eventValue
		}
		
	if object_index = ConditionTimer
	    instance_destroy()
}
