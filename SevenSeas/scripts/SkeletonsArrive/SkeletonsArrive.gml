function SkeletonsArrive() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, SkeletonSailBy, SkeletonLootFast, SkeletonLootQuiet) 
	    ds_list_add(buttonStats, 3, 3, 5)
	    ds_list_add(buttonRequires, global.eventDiff[3, 0], global.eventDiff[3, 1], global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "Sail by the ship", "Quickly loot the ship", "Silently loot the ship")
        
	    global.allowSelect = false
	    captionText = "Ghost Ship!"
    
	    eventText = "An unsettling ship floats by, seemingly unmanned..."   
	    global.moraleBoost = "skeletons"
	    myShip = instance_create(-1000,0,ShipEvent)
		with myShip{
			myShipType = SkeletonShip        
	        myShipHull = SkeletalShipSpr
			flagColor = c_white
	        myFlag = SkeletalFlagSpr
		}
	}
}

function SkeletonSailBy() {
	//engage
	if !argument0{
		ds_list_add(global.notificationList, "Risen Dead!", "Figures begin to rise from the deck, and the unmanned ship opens fire!")
		with instance_create(0,0,SkeletonShip)
			{
			flagColor = other.myShip.flagColor
			myShipHull = other.myShip.myShipHull
			shipType = other.myShip.shipType
			}
		instance_destroy(EventDrawer)
	}
}

function SkeletonLootFast() {
	if argument0{
		ds_list_add(global.notificationList, "safely looted!", "the crew run around the deck full of bones, and quickly return with a small load of cargo")
		GetRandomLoot(irandom_range(1,2), "cargo", undefined)
	}
	else{
		ds_list_add(global.notificationList, "skeletal suprise!", "scattered bones knit themselves together, and soon your ship is boarded by a skeletal crew!")
		
		//engage
		with instance_create(0,0,SkeletonShip){
			flagColor = other.myShip.flagColor
			myShipHull = other.myShip.myShipHull
			shipType = other.myShip.shipType
			//CombatRunner.closeRange = true
			}
		instance_destroy(EventDrawer)
	}
}

function SkeletonLootQuiet() {
	if argument0{
		ds_list_add(global.notificationList, "safely looted!", "the crew creep around the bones on the deck, and quietly return with a large load of cargo")
		GetRandomLoot(3, "cargo", undefined)
	}
	else{
		ds_list_add(global.notificationList, "skeletal attack!", "a crew member bumps a pile of bones, awaking an undead crew!")
		
		//engage
		with instance_create(0,0,SkeletonShip){
			flagColor = other.myShip.flagColor
			myShipHull = other.myShip.myShipHull
			shipType = other.myShip.shipType
			//CombatRunner.closeRange = true
			}
		instance_destroy(EventDrawer)
	}
}

