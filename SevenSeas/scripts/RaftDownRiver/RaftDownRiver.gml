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
		with lostPirate
			event_user(3)
		
		loot = GetRandomLoot(choose(2,2,3), "Treasure", [-1, 0, 1])
		lootText = getItemText(loot, ["equipment", "bags of gold", "fine jewels"])
	
		ds_list_add(global.notificationList, "unsettling trade!", "The crew return with " + lootText + ", but refuse say how " + lostPirate.firstName + " lost their limb.")
	}
	else{
		var lostPirate = RandomPirate()
		
		ds_list_add(global.notificationList, "Skeletal Crew Member!", lostPirate.name + " returned a cursed pirate! They cannot eat until the curse is lifted.")
		global.moraleBoost = "skeleton" 
		with lostPirate{
			body = sprite_get_number(PirateManSkinSpr)-1
			face = sprite_get_number(PirateManFaceSpr)-1
			UpdateMorale(-5, -1)
			UpdateMorale(3, global.DARING)
			
			if surface_exists(fullPirateSurface)
				MakePirateSurface(fullPirateSurface, 0, 0)
			if surface_exists(smallPirateSurface)
				MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
			if surface_exists(tagPirateSurface)
				MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)
		}
	}
}
