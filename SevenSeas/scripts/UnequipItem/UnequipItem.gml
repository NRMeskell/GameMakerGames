function UnequipItem(argument0) {
	if argument0.myPirate != noone{
		argument0.state = "floating"
		ds_list_add(ItemRunner.floatingItems, argument0)
		argument0.selected = false
		
		with argument0.myPirate{
			if myHat == argument0.id
				myHat = instance_create(0,0,ItemParent)
			if myShirt == argument0.id
				myShirt = instance_create(0,0,ItemParent)
			if myRightHand == argument0.id
				myRightHand = instance_create(0,0,ItemParent)
			if myLeftHand == argument0.id
				myLeftHand = instance_create(0,0,ItemParent)
			if myPants == argument0.id
				myPants = instance_create(0,0,ItemParent)
			if myPet == argument0.id
				myPet = instance_create(0,0,ItemParent)
		}
		
		argument0.myPirate = noone
	}
}