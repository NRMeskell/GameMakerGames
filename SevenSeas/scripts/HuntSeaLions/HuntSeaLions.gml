function HuntSeaLions() {
	//Get Treasure

	global.moraleBoost = "hunting"
	result = irandom(3)
	
	if result == 0 {
		with Pirate {
			UpdateHealth(id, -15)
		}
		loot = GetRandomLoot(irandom_range(1,2), "Sea Lions", [4, 4, 6])
		ds_list_add(global.notificationList, "Dangerous Hunting!", "The crew kill several sea lions, but the herd is aggressive and fights back!")
		
	}
	else if result <= 2 and irandom(2) > 0{
		ds_list_add(global.notificationList, "Nothing Found", "The barren rocks had nothing of interest, and the few sea lions quickly swam away.")
	}
	else {
		loot = GetRandomLoot(irandom_range(1,3), "Jewels", [1])
		ds_list_add(global.notificationList, "Precious Stones!", "Among the rocks, a number of small shiny rocks are spotted by the crew!")
	}
}
