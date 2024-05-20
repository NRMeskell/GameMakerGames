function NewWeaponAllow() {
	if !sign(irandom(2))
	    {
		ds_list_add(global.notificationList, "explosive weapon!", myPirate.firstName + " returns with a dangerous looking firearm.")
		preview = GenerateHandItem(0)
		preview.spriteIndex = EquipHandSpr
		
		if irandom(1){
		    preview.itemNumber = 18
		    preview.itemName = "Boom Stick"
		    preview.itemInfo = "An ominous weapon, likely to explode at any moment"
		    preview.twoHanded = true
		    preview.bonus[0] = 0
		    preview.bonus[1] = 4
			}
			
		ds_list_add(ItemRunner.floatingItems, MakeHandItem(preview))
		instance_destroy(preview)
	    }
	else
	    {
		cargoLost = irandom(3)+1
		myPirate.myHealth -= irandom(1)*5+5
		myShip.myHealth -= irandom(2)*10+10
	    ds_list_add(global.notificationList, "dangerous explosion!", myPirate.firstName + " caused an explosion which damaged the ship, " + string(cargoLost) + " cargo, and injured them!")
	    global.foodQuality -= 0.2
	    }
}
