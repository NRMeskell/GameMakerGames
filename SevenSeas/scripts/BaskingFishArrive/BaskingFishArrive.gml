function BaskingFishArrive() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, closeEventCode, BakingFishCatch)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Sail past the fish", "Try to harpoon the fish")
        
	    global.allowSelect = false
	    captionText = "Basking Fish!"
	    eventText = "An enormous, bejewled fish basks at the surface of the water."   
	    global.moraleBoost = "big fish"
	    }

	instance_create(-1000,0,BaskingFish)
}


function BakingFishCatch(){
	if argument0{
		var grabbed = GetRandomLoot(irandom_range(1, 3), "Fish", [1, 4, 6])
		var grabbedText = getItemText(grabbed, ["","scales","","","meat","","muscles"])
		ds_list_add(global.notificationList, "Giant Fish Slain!", "The crew reel in the fish, and are able to pull " + grabbedText + " from it!")
	}
}
