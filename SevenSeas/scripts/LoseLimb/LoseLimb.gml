// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function LoseLimb(argument0){
	var newInjury, lostLimb = false;
	if argument0 == undefined
		newInjury = choose("hand", "leg", "eye")
	else 
		newInjury = argument0

	if myHealth < 1
		exit;

	if myPet.itemPower != "full health"{

		global.moraleBoost = "injury"

		UpdateMorale(-2, -1)

		if newInjury = "hand"
		    {
			// Default to right hand
			var loseRightHand;
			// Force switch to left hand 
			if (myLeftHand.itemName == "none" and myRightHand.itemName == "none")
				loseRightHand = choose(false, true)
			else if (myLeftHand.itemName == "none")
				loseRightHand = false
			else if (myRightHand.itemName == "none")
				loseRightHand = true
			else
				loseRightHand = (choose(false, true) and !handLostRight) or handLostLeft
		
			if loseRightHand and !handLostRight
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
				lostLimb = true
		        }
		    else if !handLostLeft
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
				lostLimb = false
		        }
		    }
    
		if newInjury = "leg" {
		    if (choose(true, false) and !legLostRight) or (legLostLeft){
		        if !legLostRight {
		            legsLost ++
					lostLimb = true
				}
		        legLostRight = true
		    }
		    else {
		        if !legLostLeft {
					lostLimb = true
		            legsLost ++
				}
		        legLostLeft = true
		    }
		}
    
		if newInjury = "eye" {
		    if (choose(true, false) and !eyeLostRight) or (eyeLostLeft) {
		        if !eyeLostRight {
					lostLimb = true
		            eyesLost ++
				}
		        eyeLostRight = true
		    }
		    else {
		        if !eyeLostLeft {
					lostLimb = true
		            eyesLost ++
				}
		        eyeLostLeft = true
		    }
		}
		
		if lostLimb
			ds_list_add(global.notificationList, "Lost Limb!", name + " lost their " + newInjury + "!")
	}

	if surface_exists(fullPirateSurface)
		MakePirateSurface(fullPirateSurface, 0, 0)
	if surface_exists(smallPirateSurface)
		MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
	if surface_exists(tagPirateSurface)
		MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)


	return newInjury
}