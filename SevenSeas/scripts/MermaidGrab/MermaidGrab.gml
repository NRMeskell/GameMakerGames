function MermaidGrab() {
	//rest

	with Pirate
	    {
	    UpdateHealth(id, -25)
	    }
    
	if !argument0
	    {
	    with Pirate{
	        UpdateMorale(-1, -1)
	        UpdateMorale(1, global.FEARSOME)
	        }
	    ds_list_add(global.notificationList, "Driven away!", "the crew fights the mermaids, but cannot get the treasure!")
	    }
	else
	    {
	    with Pirate
	        {
	        UpdateMorale(1, -1)
	        UpdateMorale(1, global.FEARSOME)
	        }
        
	    ds_list_add(global.notificationList, "Got Treasure!", "the crew fights the mermaids, and eventually gets the treasure!")
    
	    GetRandomLoot(irandom_range(2,4), "Chest", [-1,0,1])
		}
	script_execute(closeEventCode, 2)







}
