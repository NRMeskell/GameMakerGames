function FrogKingCrown() {	
	
	ds_list_add(global.notificationList, "Crown Returned!", "The frog king leaps in delight! He takes the crown, promises free passage, and presents a royal gift!")

	FrogKing.myState = "frog gift"
	
	GetRandomLoot(4, "GIFTS", undefined)
	CustomSeaLoot(true)
	CustomSeaLoot(true)
	CustomSeaLoot(true)
	CustomSeaLoot(true)
	
	with ItemParent
		if itemName == "Tropical Crown"{
			UnequipItem(id)
	        while ds_list_find_index(ItemRunner.floatingItems, id) != -1
	            ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, self.id))
	        instance_destroy()
		}

	instance_destroy(FrogKing)
	script_execute(closeEventCode)
}
