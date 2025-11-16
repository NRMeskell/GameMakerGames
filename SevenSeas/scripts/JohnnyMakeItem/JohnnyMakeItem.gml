function JohnnyMakeItem() {
	ds_list_add(global.notificationList, "Johnny Shortsticks crafts!", "Johnny shortsticks used leftover scraps to make a new item!")
	global.moraleBoost = "Johnny"
	
	var itemType = irandom(2), newItem;
	if itemType == 0
		newItem = MakeRandomHandItem(0)
	else if itemType == 1
		newItem = MakeRandomShirtItem(irandom(1))
	else
		newItem = MakeRandomPantsItem(irandom(1))
	ds_list_add(ItemRunner.floatingItems, newItem)

	JohnnyShortsticks.myState = 1



}
