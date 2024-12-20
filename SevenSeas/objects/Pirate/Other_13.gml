/// @description Lose Limb
if myHealth < 1
	exit;

if global.moraleBoost != "meal" and myPet.itemPower != "full health"{

global.moraleBoost = "injury"

UpdateMorale(-2, -1)

newInjury = choose("hand", "leg", "eye")

if newInjury = "hand"
    {
    if choose(true, false)
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
