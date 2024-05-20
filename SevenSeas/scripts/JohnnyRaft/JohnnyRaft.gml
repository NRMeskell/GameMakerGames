function JohnnyRaft() {
	ds_list_add(global.notificationList, "Johnny sent off!", "he is given directions to the nearest port, and sent off!")

	AddReputation("repute", -2, "stranding of johnny")
	
	with Pirate
	    {
	    UpdateMorale(1, global.FEARSOME)
	    }
    
	with JohnnyShortsticks
	    {
	    if irandom(2) > 0
	        {
	        instance_destroy()
	        }
	    else if irandom(1)
	        myState = "revenge" 
	    else 
	        myState = "in port"
	    }

	script_execute(closeEventCode)



}
