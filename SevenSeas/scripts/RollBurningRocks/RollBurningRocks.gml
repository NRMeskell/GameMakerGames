function RollBurningRocks(){
	global.moraleBoost = "burning rocks"
	
	if irandom(2) == 0{
		ds_list_add(global.notificationList, "Burned Hands!", "One of the rocks alights when turned over, burning the crew's hands")
		var burnPirate = RandomPirate()
		with burnPirate
			LoseLimb("hand")
	}
	else{
		var loot = GetRandomLoot(max(1, 3  + irandom_range(-1,0)), "Treasure", [0,1,4,6,9])
		var text = " " + getItemText(loot, ["", "gold nuggets", "rough jewels", "", "", "tough clams", "", "savory crabs", "", "", "ember stone"]) + "."
		ds_list_add(global.notificationList, "Burning Treasure!", "Under and among the flaming rocks, the crew find " + text) 
	}
}