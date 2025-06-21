function PlagueCrewmate(argument0) {
	crewMember = RandomPirate()
	
	//Sick Crewmate
	ds_list_add(global.notificationList, "Crewmate has plague!", crewMember.name + " becomes ill! Hopefully a doctor can prevent further spread...")
	UpdateHealth(crewMember, -myHealth div 2)
		
	if irandom(1+global.totalMedicalBonus) == 0{
		with instance_create(0,0,ConditionTimer){
		    condition = PlagueCrewmate
			crewMember = RandomPirate()
		}
	}
		
	if object_index = ConditionTimer
	    instance_destroy()
}
