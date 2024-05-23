function PortFight() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, FightAllow, FightJoin, FightBreakup)
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3,2], global.eventDiff[5, 3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "allow the fight", "join the fight", "stop the fight")
        
	    global.allowSelect = false
	    captionText = "Street Brawl!"
	    myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    eventText = myPirate.name + " got into a fight with a local!" 
	    global.moraleBoost = "brawl"
	    }





}
