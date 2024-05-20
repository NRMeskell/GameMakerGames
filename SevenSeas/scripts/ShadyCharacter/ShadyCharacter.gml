function ShadyCharacter() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, ShadyIgnore, ShadyFollow, ShadyConfront)
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 3], global.eventDiff[5, 1])
	    ds_list_add(buttonCosts, 0, instance_number(Pirate), 0)
	    ds_list_add(buttonText, "ignore them", "follow them", "confront them")
        
	    global.allowSelect = false
	    captionText = "Shady Character"
	    myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    eventText = myPirate.name + "a strange figure has been slinking around your ship." 
	    }





}
