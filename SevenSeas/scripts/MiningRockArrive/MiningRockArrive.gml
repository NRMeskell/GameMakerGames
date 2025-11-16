function MiningRockArrive() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, closeEventCode, MineRock)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Sail past the rock", "Spend time mining")
        
	    global.allowSelect = false
	    captionText = "Mineral Filled Rock!"
	    eventText = "Volcanic activity has left behind a large rock, full of bright crystals!"   
	    global.moraleBoost = "boiling"
	    }

	instance_create(-1000,0,MiningRock)
}


function MineRock(){
	Wait(1/8*Clock.fullDay, MinedRock, argument0)
}

function MinedRock(){
	if argument0{
		MiningRock.mined = true
		ds_list_add(global.notificationList, "Rock Mined!", "The crew found several precious stones deep in the rock's core!")
		GetRandomLoot(irandom_range(2, 3), "MINE", [0,0,1,1,9])
	}
	else{
		UpdateHealth(Pirate, -irandom(20))

		ds_list_add(global.notificationList, "Mining failed!", "The crew could not pry any minerals from the rock, and several crew were burned!")
	}
	
}
