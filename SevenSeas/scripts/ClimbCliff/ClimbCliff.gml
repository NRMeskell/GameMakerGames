function ClimbCliff() {
	//Dig for Treasure
	loot = GetRandomLoot(irandom_range(0, 2), "Treasure", [-1, 0, 1, 1])
	lootText = getItemText(loot, ["equipment", "gold", choose("shiny stones", "gems")])
	if irandom(2) < 1{
		hurtPirate = RandomPirate()
		UpdateHealth(hurtPirate, -hurtPirate.myHealth*0.25)
		ds_list_add(global.notificationList, "Pirate Hurt!", hurtPirate.firstName + " fell and was injured! The crew returned with " + lootText + ".")
	
	}
	else{
		ds_list_add(global.notificationList, "Safe Climb!", "The crew return with " + lootText + "!")
	}
	
}
