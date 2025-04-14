/// @description clean up the mess
function FishingAllow() {

	if sign(irandom(2))
	    {
	    fishAmount = irandom_range(1, instance_number(Pirate))
	    ds_list_add(global.notificationList, "Fish caught!", myPirate.firstName + " was very good at fishing and caught " + string(fishAmount) + " fish!");
	    StoreCargo(6, fishAmount)
	    }
	else if sign(irandom(1))
	    {
	    ds_list_add(global.notificationList, "Nothing caught!", myPirate.firstName + " caught nothing, but had a good time!")
	    }
	else
	    {
	    with myPirate
	        other.item = LoseRandomItem()
        
	    ds_list_add(global.notificationList, "item dropped overboard!", "after leaning too far overboard, " + myPirate.firstName + " dropped their " + item + "!")
    
	    }
    



}
