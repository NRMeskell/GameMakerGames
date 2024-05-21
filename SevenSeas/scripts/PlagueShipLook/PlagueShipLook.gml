function PlagueShipLook() {
	//search

	if !argument0
	    {
	    ds_list_add(global.notificationList, "Nothing Found!", "Your crew could not find the cargo hold and returns empty handed.")
		UpdateMorale(-1,-1)
	    }
	else
	    {
	    GetRandomLoot(irandom_range(1,2), "LOOTED ITEMS", [0,0,0,1,1,-1])
	    ds_list_add(global.notificationList, "Treasure Found!", "Your crew returns with barrels full of loot!")
	    UpdateMorale(1, -1)
		}
		
	if irandom(3) == 0	
		with instance_create(0,0,ConditionTimer)
			condition = PlagueCrewmate
    
	script_execute(closeEventCode, 2)



}
