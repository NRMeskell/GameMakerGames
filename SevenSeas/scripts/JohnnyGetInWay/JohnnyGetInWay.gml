function JohnnyGetInWay() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 1
	    buttonNumber = 2
	    ds_list_add(buttons, JohnnyThrow, JohnnyStay, JohnnyTeachRopes) 
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "throw him overboard", "let him stay on board", "give safety lesson")
        
	    global.allowSelect = false
	    captionText = "johnny shortsticks"
	    foodAmount = irandom(2) + 1
	    LoseCargo(4, foodAmount)
	    eventText = "johnny untied a rope and the sails were let loose, damaging the ship!" 
	    global.moraleBoost = "Johnny"
	    }





}
