function BugsAttack() {
	//Merchant Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, BugsIgnore, BugsCover, BugsTrap)
	    ds_list_add(buttonStats, 0, 3, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1], global.eventDiff[6, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "ignore the problem", "cover up the crew", "Make bug traps")
        
	    global.allowSelect = false
	    captionText = "Bug Swarms!"
	    eventText = "Misquitos swarm the ship, eating the crew alive!"
	    global.moraleBoost = "bugs"
	    }






}
