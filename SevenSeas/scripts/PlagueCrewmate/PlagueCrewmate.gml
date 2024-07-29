function PlagueCrewmate(argument0) {
	
	//Sick Crewmate
	ds_list_add(global.notificationList, "Crewmate has plague!", eventValue.name + " becomes ill! They may spread the sickness among the crew, unless the ship's medical capabilities are good enough!")
	eventValue.myHealth *= 0.5
		
	if irandom(1+global.totalMedicalBonus) == 0{
		with instance_create(0,0,ConditionTimer){
		    condition = PlagueCrewmate
			eventValue = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		}
	}
		
	if object_index = ConditionTimer
	    instance_destroy()
}
