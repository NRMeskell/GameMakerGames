function JohnnyRunOff() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 1
	    buttonNumber = 3
	    ds_list_add(buttons, JohnnyCall, JohnnyWait, JohnnyLeave) 
	    ds_list_add(buttonStats, 0, 0, 0)
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "call him back", "wait for his return", "leave him behind")
        
	    global.allowSelect = false
	    captionText = "Johnny Shortsticks"
    
	    eventText = "johnny shortsticks runs into the market and disappears into the crowd!" 
	    global.moraleBoost = "Johnny"
	    }





}
