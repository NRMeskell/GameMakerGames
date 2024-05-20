function LoseRandomItems(argument0) {
	//Lose Cargo
	lostItems = ""
	itemNumber = 0

	with ItemParent
	    if state == "equipped"
	        other.itemNumber ++

	lostItemNumber = min(itemNumber, argument0)

	repeat lostItemNumber
	    {   
	    myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    with myPirate
	        {
	        if other.lostItems != ""
	            other.lostItems += "#"
            
	        other.lostItems += firstName + "'s " + LoseRandomItem()
	        }
	    }
     
	return lostItems



}
