function JohnnyTeachRopes() {
	ds_list_add(global.notificationList, "Lesson Given!", "Johnny says he'll try to remember not to touch the ropes.")
	LoseCargo(4, 1)

	with Pirate
	    {
	    UpdateMorale(-1, global.KEEN)
	    }
    
	with JohnnyShortsticks
	    ds_list_delete(myEvents, ds_list_find_index(myEvents, JohnnyGetInWay))

	script_execute(closeEventCode)



}
