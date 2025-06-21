/// @description Create Bats and set Timer
function RaftDownRiver() {
	global.moraleBoost = "river"
	
	if irandom(1){
		ds_list_add(global.notificationList, "frightening river!", "The fearful crew return quickly, frightened by the unsettling river.")
		UpdateMorale(-2, -1)
		UpdateMorale(1, global.KEEN)
		UpdateMorale(1, global.DARING)
	}
	else if irandom(3) > 0 {
		var lostPirate = RandomPirate()
		var limb; 
		with lostPirate
			limb = LoseLimb(undefined)
		
		loot = GetRandomLoot(choose(2,2,3), "Treasure", [-1, 0, 1])
		lootText = getItemText(loot, ["equipment", "bags of gold", "fine jewels"])
	
		ds_list_add(global.notificationList, "unsettling trade!", "The crew return with " + lootText + ", but refuse say how " + lostPirate.firstName + " lost their " + limb + ".")
	}
	else{
		var lostPirate = RandomPirate()
		
		ds_list_add(global.notificationList, "Cursed Crew Member!", lostPirate.name + " returned a cursed pirate! They cannot eat until the curse is lifted.")
		CursePirate(lostPirate)
		
		global.moraleBoost = "skeleton" 
	}
}
