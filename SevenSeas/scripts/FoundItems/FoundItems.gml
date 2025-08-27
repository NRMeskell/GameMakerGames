function FoundItems() {
	itemLevel = max(0, global.seaLevel -1)
	type = irandom(10)
	if type == 0 
		newItem = MakeRandomHatItem(itemLevel)
	else if type < 3
		newItem = MakeRandomShirtItem(itemLevel)
	else if type < 6
		newItem = MakeRandomPantsItem(itemLevel)
	else
		newItem = MakeRandomHandItem(itemLevel)

	ds_list_add(global.notificationList, "Found Item!", "In the confusion of unloading the ship, an extra item was found without a clear owner")
	ds_list_add(ItemRunner.floatingItems, newItem)
}
