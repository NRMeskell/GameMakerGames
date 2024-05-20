/// @description Create Bats and set Timer
function LookInCave() {
	global.moraleBoost = "caving"
	with Pirate
		{
		UpdateMorale(irandom_range(-3+other.campPower, 0), -1)
		UpdateMorale(1, global.DARING)
		}
		
	loot = GetRandomLoot(choose(1,1,1,2,2,3), "Treasure", [-1, 0, 1])
	lootText = getItemText(loot, ["equipment", choose("sifted gold", "mined gold"), choose("precious stones", "gems", "jewels")])
	ds_list_add(global.notificationList, "frightening cave!", "The dark cave was frightening, but the crew returned with " + lootText + "!")
	
}
