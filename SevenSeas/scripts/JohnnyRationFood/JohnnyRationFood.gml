function JohnnyRationFood() {
	ds_list_add(global.notificationList, "Food set aside!", "a portion of food is set aside to feed Johnny.")
	LoseCargo(4, 1)

	with Pirate
	    {
	    UpdateMorale(-1, global.FEARSOME)
	    }
    
	with JohnnyShortsticks
	    {
	    ds_list_delete(myEvents, ds_list_find_index(myEvents, JohnnyEatsFood))
	    }

	script_execute(closeEventCode)



}
