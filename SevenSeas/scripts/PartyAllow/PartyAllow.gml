function PartyAllow() {
	foodUsed = min(CargoAmount(5), instance_number(Pirate) div 3)
	LoseCargo(5,instance_number(Pirate) div 3)

	with Pirate{
	    if other.foodUsed > 0{
	        UpdateMorale(1, -1)
		    UpdateMorale(-1, global.FEARSOME)
			}
		else{
			UpdateMorale(-1, -1)
		}
	    }
 
	if foodUsed > 0   
	    ds_list_add(global.notificationList, "Grand Party!", string(foodUsed) + " grog used, and the crew had a grand time!")
	else
	    ds_list_add(global.notificationList, "Poor Party!", "without grog to use, the party is a little disappointing.")
}
