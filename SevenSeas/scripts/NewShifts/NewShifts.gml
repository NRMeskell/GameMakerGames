function NewShifts(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    buttonNumber = 2
	    ds_list_add(buttons, ShiftsAllow) 
     
	    global.allowSelect = false
	    eventText = "Can I work a different shift? My current shift overlaps with my " + choose("lunch", "bed time", "dinner", "breakfast", "relaxation") + "."
	    global.moraleBoost = "new shift"
	    }






}
