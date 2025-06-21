function SearchWreckage() {
	//Get Treasure

	global.moraleBoost = "wreckage"
	result = irandom(campPower)
	
	if result <=1 {
		GetRandomLoot(irandom(1), "treasure", [-1, 0, 1])
		UpdateHealth(Ship, -(Ship.myHealth * 0.25) div 1)
		ds_list_add(global.notificationList, "Run Aground!", "The ship was washed into the rocks, and the crew had to return early with limited goods.")
	}
	else if result == 2 or irandom(1){
		loot = GetRandomLoot(irandom(campPower), "treasure", [-1, 0, 1])
		lootText = getItemText(loot, [choose("items", "equipment"), "gold", choose("jewels", "treasure")])
		ds_list_add(global.notificationList, "old chests found!", "Chests filled with " + lootText + " are found deep within the wreckage!")
		}
	else{
		newPirate = CreatePirate(true)
    
		if newPirate != undefined{
			ds_list_add(global.notificationList, "Wrecked Sailor!", "A sailor is found among the wreckage, and he gratefully joins the crew.")
		}
		else{
			loot = GetRandomLoot(irandom(campPower), "treasure", [-1, 0, 1])
			lootText = getItemText(loot, [choose("items", "equipment"), "gold", choose("jewels", "treasure")])
			ds_list_add(global.notificationList, "old chests found!", "Chests filled with " + lootText + " are found deep within the wreckage!")
		}
	}
}
