function MessyAllow() {

	if irandom(1)
		ds_list_add(global.notificationList, "Crew relieved!", otherPirate.firstName + "'s bunk was cleaned up, and the crew enjoy a cleaner space.")
	else{
		if irandom(1){
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

			ds_list_add(global.notificationList, "Found Item!", "while cleaning " + otherPirate.firstName + "'s bunk, a missing item was found!")
			ds_list_add(ItemRunner.floatingItems, newItem)
		}
		else{
			with myPirate
				other.item = LoseRandomItem()
			ds_list_add(global.notificationList, "Item Lost!", "while cleaning " + otherPirate.firstName + "'s bunk, their " + item + " went missing!")
				
		}
	}

	with otherPirate
		UpdateMorale(-2, -1)
		
	with Pirate{
		UpdateMorale(1, global.KEEN)
		UpdateMorale(1, global.JOLLY)
	}

}
