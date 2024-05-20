function FoundItems() {
	itemLevel = max(0, global.seaLevel -1)
	type = irandom(4)
	if type == 0 
		newItem = MakeRandomHatItem(itemLevel)
	else if type == 1
		newItem = MakeRandomShirtItem(itemLevel)
	else if type == 2
		newItem = MakeRandomPantsItem(itemLevel)
	else if type <= 4
		newItem = MakeRandomHandItem(itemLevel)

	ds_list_add(global.notificationList, "Found Item!", "In the confusion of unloading the ship, an extra item was found without a clear owner")
	ds_list_add(ItemRunner.floatingItems, newItem)
}
