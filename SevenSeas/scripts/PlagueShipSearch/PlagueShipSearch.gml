function PlagueShipSearch() {
	//engage

	if !argument0
	    {
	    ds_list_add(global.notificationList, "Nothing Found!", "After searching the ship, your crew returns empty handed.")
		UpdateMorale(-1,-1)
	    }
	else
	    {
	    GetRandomLoot(irandom_range(3,4), "LOOTED ITEMS", [0,0,0,1,1,2,3,4,5,-1])
	    ds_list_add(global.notificationList, "Treasure Found!", "Your crew returns with barrels full of cargo and loot!")
	    UpdateMorale(1, -1)
		}
		
	if irandom(2) == 0	
		with instance_create(0,0,ConditionTimer)
			condition = PlagueCrewmate

	script_execute(closeEventCode, 2)







}
