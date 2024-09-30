function DigForTreasure() {
	//Dig for Treasure

	audio_stop_sound(DiggingSnd)
	treasureFound = irandom(3) == 0
	with TreasureChest{
		treasureFound = other.treasureFound
		event_user(2)
	}
	
	if treasureFound
	    {
		loot = GetRandomLoot(irandom_range(3,4), "Chest", [-1, 0, 0, 0, 1, 1])
		lootText = getItemText(loot, [choose("gear", "equipment"), choose("gold", "loot", "booty"), choose("gems", "stones", "jewels")])
		ds_list_add(global.notificationList, "A Chest!", "The crew was clever and found a chest full of " + lootText + "!")
	    }
	else
	    {
		ds_list_add(global.notificationList, "nothing found!", "after digging across the beach, no treasure could be found.")
		}
	
}
