function KnifeAllow() {
	if sign(irandom(1))
	    {
	    ds_list_add(global.notificationList, "New Knife!", myPirate.firstName + " presents a large knife, ready for battle.")
	    preview = GenerateHandItem(0)
	    preview.spriteIndex = EquipHandSpr
	    preview.itemNumber = 16
	    preview.itemName = "Butcher knife"
	    preview.itemInfo = "A large kitchen knife, great for cutting meat"
	    preview.twoHanded = false
	    preview.bonus[0] = global.seaLevel div 2 + 1
	    preview.bonus[1] = 0
	    ds_list_add(ItemRunner.floatingItems, MakeHandItem(preview))
	    instance_destroy(preview)
	    }
	else
	    {
	    ds_list_add(global.notificationList, "damaged knife!", "the knife is poor for combat and is ruined. Meal quality lowers without a knife!")
	    global.foodQuality -= 0.25
	    }
}
