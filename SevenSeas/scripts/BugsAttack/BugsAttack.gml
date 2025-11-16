function BugsAttack() {
	//Merchant Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, BugsIgnore, BugsTrap)
	    ds_list_add(buttonStats, 0, 6)
	    ds_list_add(buttonRequires, 0, global.eventDiff[6, 2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "ignore the problem", "Make bug traps")
        
	    global.allowSelect = false
	    captionText = "Bug Swarms!"
	    eventText = "mosquitoes swarm the ship, attaking the crew and irritating everyone!"
	    global.moraleBoost = "bugs"
		
		audio_play_sound(BugsBuzzingSnd, 0, true)
	    }
}
