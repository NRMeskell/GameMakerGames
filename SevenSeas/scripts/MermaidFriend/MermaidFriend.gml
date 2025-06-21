function MermaidFriend() {
	//intimidate

	if argument0
	    {
	    with Pirate
	        {
	        UpdateMorale(1, -1)
	        UpdateMorale(-2, global.FEARSOME)
	        }
        
	    GetRandomLoot(irandom_range(2,4), "OFFER", [-1,0,1])
	    ds_list_add(global.notificationList, "Befriended!", "The mermaids enjoy your company and offer some treasure!")
	    }
	else
	    {
	    with Pirate
	        {
	        UpdateHealth(id, -20)
	        UpdateMorale(-1,-1)
	        UpdateMorale(1, global.FEARSOME)
	        }
    
	    ds_list_add(global.notificationList, "Attacked!", "The mermaids attack the crew before disappearing underwater!")
	    }

	script_execute(closeEventCode, 2)



}
