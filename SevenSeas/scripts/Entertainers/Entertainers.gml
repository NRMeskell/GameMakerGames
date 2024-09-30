function Entertainers() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, EntertainPass, EntertainWatch, EntertainSteal)
	    ds_list_add(buttonStats, 0, 0, 3)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[3, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "ignore the performance", "watch the performance", "pickpocket the crowd")
        
	    global.allowSelect = false
	    captionText = "Entertainers!"
	    type = choose("jugglers", "acrobats", "musicians", "story-tellers")
	    eventText = "A crowd is gathering around a group of " + type + "!"
	    global.moraleBoost = "show"
	    }





}
