function DesertWander() {
	//Dig for Treasure
	
	if irandom(3) > 0
	    {
		ds_list_add(global.notificationList, "nothing found!", "a day of wandering into the desert has lowered the crew's morale.")
		UpdateMorale(-2, -1)	
		with Pirate 
			myHealth -= 15
		}
	else
	    {
		loot = GetRandomLoot(choose(1,2), "Items", [-1, 0, 0, 1, 3])
		lootText = getItemText(loot, ["fallen items", "sifted gold", "precious stones", "", "dry boards"])
		
		ds_list_add(global.notificationList, "items found!", "the crew is surprised to find " + lootText + " in this arid desert.")
		with Pirate 
			myHealth -= 15
		}
}
