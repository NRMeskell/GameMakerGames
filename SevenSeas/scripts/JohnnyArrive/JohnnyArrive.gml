function JohnnyArrive() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 1
	    buttonNumber = 2
	    ds_list_add(buttons, JohnnyDeny, JohnnyAllow)
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "deny his request", "allow him to join")
        
	    global.allowSelect = false
	    captionText = "Johnny Shortsticks"
	    if JohnnyShortsticks.myState != "unmet"
	        eventText = "johnny shortsticks spots and recognises you and asks to sail with you again!" 
	    else
	        eventText = "a curly-haired boy named johnny shortsticks asks to sail with you! he promises to not get in the way." 
	    JohnnyShortsticks.myState = "in port"
	    global.moraleBoost = "Johnny" 
	    }
}
