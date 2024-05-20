function JohnnyEatsFood() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 1
	    buttonNumber = 2
	    ds_list_add(buttons, JohnnyThrow, JohnnyStay, JohnnyRationFood) 
	    ds_list_add(buttonStats, 0, 0, 6)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[6, 1])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "throw him overboard", "let him stay on board", "ration him extra food")
        
	    global.allowSelect = false
	    captionText = "johnny shortsticks"
	    foodAmount = irandom(2) + 1
	    LoseCargo(4, foodAmount)
	    eventText = "johnny was found eating " + string(foodAmount) + " food! He claims to not get enough normally." 
	    global.moraleBoost = "Johnny"
	    }





}
