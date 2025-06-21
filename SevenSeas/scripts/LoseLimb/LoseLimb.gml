// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoseLimb(argument0){
	var newInjury;
	if argument0 == undefined
		newInjury = choose("hand", "leg", "eye")
	else 
		newInjury = argument0

	if myHealth < 1
		exit;

	if global.moraleBoost != "meal" and myPet.itemPower != "full health"{

	global.moraleBoost = "injury"

	UpdateMorale(-2, -1)

	if newInjury = "hand"
	    {
		// Default to right hand
		var loseRightHand;
		// Force switch to left hand 
		if (myLeftHand.itemName == "none" and myRightHand.itemName == "none")
			loseRightHand = choose(false, true)
		else if (myLeftHand.itemName == "none" and myRightHand.itemName != "none")
			loseRightHand = false
		else if (myLeftHand.itemName != "none" and myRightHand.itemName == "none")
			loseRightHand = true
		else
			loseRightHand = choose(false, true)
		
		if loseRightHand
	        {
	        loseItem = myRightHand
			UnequipItem(loseItem)
		    with loseItem
		        {
		        while ds_list_find_index(ItemRunner.floatingItems, id) != -1
		            ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, id))
		            instance_destroy()
		        }
			myRightHand = instance_create(0,0,ItemParent)
	        handLostRight = true
	        }
	    else
	        {
	        loseItem = myLeftHand
			UnequipItem(loseItem)
		    with loseItem
		        {
		        while ds_list_find_index(ItemRunner.floatingItems, id) != -1
		            ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, id))
		            instance_destroy()
		        }
			myLeftHand = instance_create(0,0,ItemParent)
	        handLostLeft = true
	        }
	    }
    
	if newInjury = "leg"
	    {
	    if choose(true, false)
	        {
	        if !legLostRight 
	            legsLost ++
	        legLostRight = true
	        }
	    else
	        {
	        if !legLostLeft 
	            legsLost ++
	        legLostLeft = true
	        }
	    }
    
	if newInjury = "eye"
	    {
	    if choose(true, false)
	        {
	        if !eyeLostRight 
	            eyesLost ++
	        eyeLostRight = true
	        }
	    else
	        {
	        if !eyeLostLeft 
	            eyesLost ++
	        eyeLostLeft = true
	        }
	    }
	}

	if surface_exists(fullPirateSurface)
		MakePirateSurface(fullPirateSurface, 0, 0)
	if surface_exists(smallPirateSurface)
		MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
	if surface_exists(tagPirateSurface)
		MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)

	return newInjury
}