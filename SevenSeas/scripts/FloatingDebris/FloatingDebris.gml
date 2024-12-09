function FloatingDebris() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, DebrisAvoid, DebrisSearch, DebrisDive)
	    ds_list_add(buttonStats, 5, 3, 3)
	    ds_list_add(buttonRequires, global.eventDiff[5, 0], global.eventDiff[3, 2], global.eventDiff[3,3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "avoid the debris", "search for supplies", "dive for treasure" )
        
	    global.allowSelect = false
	    captionText = "Floating Debris!"
    
	    eventText = "The crew find themselves in a sea of broken planks, floating barrels, and odd scraps." 
	    global.moraleBoost = "debris"  
	    }
		
	repeat(10)
		with instance_create(0,0,Barrel){
			if irandom(1) sprite_index = DebrisSpr
			placeX = irandom_range(-100, 100)
			image_xscale = choose(-1, 1)
			image_index = choose(0, 1)
		}
}

function DebrisAvoid() {
	if argument0{
		ds_list_add(global.notificationList, "Debris Avoided!", "The crew works hard and eventually finds their way safely out.")
		
	}
	else{
		ds_list_add(global.notificationList, "Debris stike!", "several large chunks of debris hit the ship, damaging the hull.")
		Ship.myHealth -= irandom_range(50, 150) div 5 * 5
	}
	closeEventCode()
}

function DebrisSearch() {
	if argument0{
		title = "debris"
		loot = GetRandomLoot(irandom_range(1,3), "supplies", [2,3,4,5])
		lootText = getItemText(loot, ["", "", "", "cannonballs", "old planks", "stale rations", "aged grog", ""])
		text = "Among the floating wreckage, old boxes of " + lootText + " are spotted!"
		ds_list_add(global.notificationList, title, text)
	}
	else{
		injuredPirate = RandomPirate()
		injuredPirate.myHealth -= 20
		ds_list_add(global.notificationList, "Hit by Debris!", injuredPirate.firstName + " was struck by a floating plank, and the crew had to abandon their search.")
	}
	closeEventCode()
}

function DebrisDive() {
	if argument0{
		title = "debris"
		loot = GetRandomLoot(irandom_range(2,4), "supplies", [-1, 0, 1])
		lootText = getItemText(loot, ["wardrobes", "treasure boxes", "gold chests", "cannonballs", "old planks", "stale rations", "aged grog", ""])
		text = "Sunk under the debris, the crew find " + lootText + ", and swim them aboard!"
		ds_list_add(global.notificationList, title, text)
	}
	else{
		with Pirate myHealth -= 35
		ds_list_add(global.notificationList, "Shark Attack!", "the crew was attacked by a hungry shark, and had to swim quickly to the surface!")
	}
	closeEventCode()
}
