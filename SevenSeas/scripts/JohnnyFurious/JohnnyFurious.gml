function JohnnyFurious() {
	result = irandom(1)
	global.moraleBoost = "Johnny"

	if result == 0
	    {
	    UpdateHealth(Ship, -(Ship.myHealth * 1/4) div 1)
	    text = "Johnny returns, and is none too happy! he lights a small fire on the ship before running off!"
	    }
	if result == 1
	    {
	    myPirate = RandomPirate() 
	    with myPirate
	        other.item = LoseRandomItem()
	    text = "Johnny returns, and is none too happy! he steals a " + item + " from " + myPirate.name + " before running off!"
	    }
    
	with JohnnyShortsticks
	    if irandom(1)
	        instance_destroy()


	ds_list_add(global.notificationList, "Johnny Shortsticks' revenge!", text)



}
