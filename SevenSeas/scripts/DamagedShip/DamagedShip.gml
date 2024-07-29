function DamagedShip() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, PlagueShipPass, DamagedShipSearch)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "pass the ship by", "search the ship for treasure")
        
	    global.allowSelect = false
	    captionText = "Damaged Ship!"
    
	    eventText = "A broken ship floats by slowly. Who knows what damaged it, but perhaps there be treasure aboard!" 
	    global.moraleBoost = "damaged ship"  
	    }
		
    repeat(3)
		 instance_create(0,0,BirdEvent)
	
	with instance_create(0,0,ShipEvent){
		image_index = 2
	}
}

function DamagedShipSearch() {
	//search

	if argument0
	    {
	    GetRandomLoot(irandom_range(1,2), "LOOTED ITEMS", [0,0,0,1,1,-1])
	    ds_list_add(global.notificationList, "Treasure Found!", "Your crew returns with barrels full of loot!")
	    UpdateMorale(1, -1)
	}
	else{
	    if irandom(1)
			ds_list_add(global.notificationList, "Nothing Found!", "The ship is too damaged to explore, and the crew returns empty-handed.")
		else{
			if global.seaType == MapCreator.seaNames[2]{
				ds_list_add(global.notificationList, "TRAP!", "The damaged ship was bait, and a scavenger ship appears from behind a rock!")
				instance_create(0,0,ScavengerShip)
			}	
		}
	}
	with EventDrawer
		floatAway = true
}
