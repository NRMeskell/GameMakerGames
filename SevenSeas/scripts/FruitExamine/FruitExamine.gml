function FruitExamine() {
	// safely play
	if argument0{
		if irandom(1){
		    ds_list_add(global.notificationList, "delicious fruit!", "the fruit is safe to eat, and the crew have a wonderful snack!")
			UpdateMorale(1,global.JOLLY)
			}
		else
		    {
		    ds_list_add(global.notificationList, "delicious  fruit!", "The fruit is sour until cooked well, but once cooked is wonderful!")
		    UpdateMorale(1,global.DARING)
		    UpdateMorale(1,global.KEEN)
		    }
    
		UpdateMorale(1,-1)
		}
	else{
		if irandom(1){
			ds_list_add(global.notificationList, "inedible fruit!", "the fruit is deemed unsafe, and the crew leave disappointed.")
			UpdateMorale(-2,global.JOLLY)
			UpdateMorale(-2,global.KEEN)
		}
		else{
			ds_list_add(global.notificationList, "inedible fruit!", "the fruit is deemed safe, but is so sour that the crew become sick.")
			UpdateMorale(-1,-1)
			with Pirate{
				UpdateHealth(id, -myHealth*0.1)
			}
		}		
			
	}

	script_execute(closeEventCode)



}
