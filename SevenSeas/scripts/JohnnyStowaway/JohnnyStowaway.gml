function JohnnyStowaway() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 1
	    buttonNumber = 2
	    ds_list_add(buttons, JohnnyThrow, JohnnyStay, JohnnyRaft) 
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 1])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "throw him overboard", "let him stay on board", "give him a raft")
        
	    global.allowSelect = false
	    captionText = "johnny shortsticks"
    
	    eventText = "johnny is found on board hiding in the cargo. He claims he 'just wanted to be a real pirate!'" 
	    global.moraleBoost = "Johnny"
	    }





}
