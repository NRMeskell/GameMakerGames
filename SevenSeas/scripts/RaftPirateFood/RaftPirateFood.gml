function RaftPirateFood() {

	if irandom(3) == 0{
		ds_list_add(global.notificationList, "Food delivered!", "The food lands safely in the sailors raft. He throws an item up to the ship as a thanks!")
		var itemType = irandom(2), newItem;
		if itemType == 0
			newItem = MakeRandomHandItem(0)
		else if itemType == 1
			newItem = MakeRandomShirtItem(irandom(1))
		else
			newItem = MakeRandomPantsItem(irandom(1))
		ds_list_add(ItemRunner.floatingItems, newItem)

		}
	else{
		//interrogation code
		ds_list_add(global.notificationList, "Food delivered!", "the food lands safely on the raft. The sailor thanks you for the food as they float away.")
		}
    
	script_execute(closeEventCode)
}
