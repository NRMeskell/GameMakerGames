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
	    myPirate = RandomPirate()
	    with myPirate
	        {
	        if other.lostItems != ""
	            other.lostItems += "#"
            
	        other.lostItems += firstName + "'s " + LoseRandomItem()
	        }
	    }
     
	return lostItems



}
